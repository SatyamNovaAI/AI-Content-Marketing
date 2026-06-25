#!/bin/bash

# Validate skills against the Agent Skills specification.
# Reference: https://agentskills.io/specification.md

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; NC='\033[0m'
SKILLS_DIR="skills"
ISSUES=0; WARNINGS=0; PASSED=0

echo "Auditing skills against the Agent Skills specification"
echo "======================================================"
echo ""

for skill_dir in "$SKILLS_DIR"/*/; do
    skill_name=$(basename "$skill_dir")
    skill_file="$skill_dir/SKILL.md"
    skill_errors=(); skill_warnings=()

    if [[ ! -f "$skill_file" ]]; then
        echo -e "${RED}FAIL $skill_name${NC} - missing SKILL.md"; ((ISSUES++)); continue
    fi

    frontmatter=$(awk '/^---$/{count++; next} count==1' "$skill_file")
    if [[ -z "$frontmatter" ]]; then
        echo -e "${RED}FAIL $skill_name${NC} - missing YAML frontmatter"; ((ISSUES++)); continue
    fi

    # name
    name_in_file=$(echo "$frontmatter" | grep "^name:" | sed 's/^name: //' | tr -d ' ')
    if [[ -z "$name_in_file" ]]; then
        skill_errors+=("Missing 'name' field")
    elif [[ "$name_in_file" != "$skill_name" ]]; then
        skill_errors+=("Name mismatch: dir='$skill_name' frontmatter='$name_in_file'")
    elif ! [[ "$name_in_file" =~ ^[a-z0-9]([a-z0-9-]{0,62}[a-z0-9])?$ ]]; then
        skill_errors+=("Invalid name format: '$name_in_file'")
    fi

    # description
    description=$(echo "$frontmatter" | grep "^description:" | head -1 | sed 's/^description: //')
    if [[ -z "$description" ]]; then
        skill_errors+=("Missing 'description' field")
    else
        desc_len=${#description}
        if [[ $desc_len -lt 1 || $desc_len -gt 1024 ]]; then
            skill_errors+=("Description length invalid: $desc_len chars (must be 1-1024)")
        fi
        echo "$description" | grep -qi "when\|mention\|use" || skill_warnings+=("Description lacks trigger phrases")
        echo "$description" | grep -qi "see\|for\|ref"      || skill_warnings+=("Description lacks a related-skill reference")
    fi

    # line count
    line_count=$(wc -l < "$skill_file")
    [[ $line_count -gt 500 ]] && skill_warnings+=("SKILL.md is $line_count lines (should be <500)")

    if [[ ${#skill_errors[@]} -gt 0 ]]; then
        echo -e "${RED}FAIL $skill_name${NC}"
        for e in "${skill_errors[@]}"; do echo -e "   ${RED}Error:${NC} $e"; done
        ((ISSUES++))
    elif [[ ${#skill_warnings[@]} -gt 0 ]]; then
        echo -e "${YELLOW}WARN $skill_name${NC}"
        for w in "${skill_warnings[@]}"; do echo -e "   ${YELLOW}Warning:${NC} $w"; done
        ((WARNINGS++))
    else
        echo -e "${GREEN}PASS $skill_name${NC}"; ((PASSED++))
    fi
done

echo ""
echo "======================================================"
echo -e "  ${GREEN}Passed: $PASSED${NC}  ${YELLOW}Warnings: $WARNINGS${NC}  ${RED}Issues: $ISSUES${NC}"
[[ $ISSUES -eq 0 ]] && exit 0 || exit 1
