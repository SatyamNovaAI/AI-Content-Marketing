# AGENTS.md

Guidelines for AI agents working in this repository.

## Repository Overview

This repository contains **Agent Skills** for GTM content and pipeline work, following the [Agent Skills specification](https://agentskills.io/specification.md). Skills install to `.agents/skills/` (the cross-agent standard). This repo also serves as a **Claude Code plugin marketplace** via `.claude-plugin/marketplace.json`.

- **Name**: GTM Content Skills
- **Creator**: Jaizendra
- **License**: MIT

## Repository Structure

```
gtm-content-skills/
├── .claude-plugin/
│   └── marketplace.json   # Claude Code plugin marketplace manifest
├── skills/                # Agent Skills (10)
│   └── skill-name/
│       └── SKILL.md       # Required skill file
├── AGENTS.md
├── CLAUDE.md              # Points to AGENTS.md
├── CONTRIBUTING.md
├── LICENSE
├── README.md
├── VERSIONS.md
└── validate-skills.sh
```

## The Brand Foundation

Every skill reads two project-local context files first (kept out of the repo via `.gitignore`):

- **BRAND.md** — positioning, ICP, voice, banned words, proof points, CTA.
- **SOUL.md** — the user's personal/founder voice (for LinkedIn and first-person content).

This is what makes output on-brand rather than generic. If they are missing, a skill should ask the user for the essentials before producing anything.

## Build / Lint / Test

Skills are content-only (no build step). Verify with the included script:

```bash
bash validate-skills.sh
```

It checks: valid YAML frontmatter, `name` matches the directory, `name` is 1–64 chars (lowercase alphanumeric + hyphens, no leading/trailing or double hyphens), `description` is 1–1024 chars, and `SKILL.md` is under 500 lines.

## Agent Skills Specification

### Required Frontmatter

```yaml
---
name: skill-name
description: What this skill does and when to use it. Include trigger phrases and related skills.
---
```

| Field         | Required | Constraints                                                    |
|---------------|----------|----------------------------------------------------------------|
| `name`        | Yes      | 1–64 chars, lowercase `a-z`, numbers, hyphens. Must match dir. |
| `description` | Yes      | 1–1024 chars. What it does + when to use it + related skills.  |
| `license`     | No       | License name (default: MIT)                                    |
| `metadata`    | No       | Key-value pairs (author, version, etc.)                        |

### Name Field Rules

- Lowercase letters, numbers, and hyphens only.
- Cannot start or end with a hyphen. No consecutive hyphens.
- Must match the parent directory name exactly.

## Writing Style

- Keep `SKILL.md` under 500 lines. Use H2 for sections, H3 for subsections.
- Second person, direct and instructional. Professional but approachable. No excessive emojis.
- Bold for key terms, tables for reference data, one idea per section.
- Every skill ends with a **Related Skills** section and routes to `output-reviewer` before shipping.

### Description Field Best Practices

Include: (1) what it does, (2) when to use it (trigger phrases), (3) related skills for scope.

```yaml
description: When the user wants to write a LinkedIn post or carousel in their personal voice. Use when the user mentions "LinkedIn post," "carousel," "hook." For non-LinkedIn content, see content-creator.
```

## Claude Code Plugin

The manifest at `.claude-plugin/marketplace.json` lists the skills for installation via:

```bash
/plugin marketplace add jaizendra/gtm-content-skills
/plugin install gtm-content-skills
```

## Git Workflow

- Branches: `feature/skill-name`, `fix/skill-name-description`, `docs/description`.
- Commits follow [Conventional Commits](https://www.conventionalcommits.org/): `feat:`, `fix:`, `docs:`.

### Pull Request Checklist

- [ ] `name` matches directory name exactly and follows the naming rules.
- [ ] `description` is 1–1024 chars with trigger phrases and a related-skill reference.
- [ ] `SKILL.md` is under 500 lines.
- [ ] No sensitive data or credentials (never commit BRAND.md / SOUL.md / .env).
