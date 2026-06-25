# Contributing

Thanks for your interest in contributing to GTM Content Skills! This guide helps you add new skills or improve existing ones.

## Adding a New Skill

### 1. Create the skill directory

```bash
mkdir -p skills/your-skill-name
```

### 2. Create the SKILL.md file

```yaml
---
name: your-skill-name
description: When to use this skill. Include trigger phrases and a related-skill reference.
metadata:
  author: your-handle
  version: 1.0.0
---

# Your Skill Name

Second-person instructions for the agent go here...
```

Optional frontmatter: `license` (default MIT), `metadata`.

### 3. Follow naming conventions

- **Directory name**: lowercase, hyphens only (e.g., `lead-gen`).
- **Name field**: must match the directory name exactly.
- **Description**: 1–1024 characters, include trigger phrases.

### 4. Structure (optional subdirs)

```
skills/your-skill-name/
├── SKILL.md           # Required — main instructions (<500 lines)
├── references/        # Optional — detailed docs loaded on demand
├── scripts/           # Optional — executable code
└── assets/            # Optional — templates, data files
```

### 5. Write effective instructions

- Keep `SKILL.md` under 500 lines; move detail to `references/`.
- Second person, step-by-step, with an output format and a quality bar.
- End with a **Related Skills** section and route to `output-reviewer` before shipping.

## Validate before you PR

```bash
bash validate-skills.sh
```

## Submitting

1. Fork the repository.
2. Create a feature branch (`git checkout -b feature/your-skill-name`).
3. Make and test your changes locally with an AI agent.
4. Open a pull request.

## Skill Quality Checklist

- [ ] `name` matches the directory name.
- [ ] `description` clearly explains when to use the skill.
- [ ] Instructions are clear and actionable.
- [ ] No sensitive data or credentials.
- [ ] Follows existing skill patterns in the repo.
