# GTM Content Skills for AI Agents

A focused collection of 10 AI agent skills that automate go-to-market content and pipeline work — content, video, decks, SOPs, proposals, lead-gen, and account research. Built for founders and GTM engineers who want AI agents to produce **on-brand** output, not generic filler. Works with Claude Code, OpenAI Codex, Cursor, Windsurf, and any agent that supports the [Agent Skills spec](https://agentskills.io).

Built by [Jaizendra](https://www.linkedin.com/in/jaizendra/).

**Contributions welcome!** Found a way to improve a skill or have a new one to add? Open a PR.

## What are Skills?

Skills are markdown files that give AI agents specialized knowledge and workflows for specific tasks. Add them to your project and your agent recognizes a GTM task and applies the right framework — in your voice.

## How Skills Work Together

Every skill reads your brand context first. `BRAND.md` (positioning, ICP, voice, banned words) and `SOUL.md` (personal voice) are the foundation — they make the output *yours*. `output-reviewer` is the gate every deliverable passes before it ships.

```
                          BRAND.md  +  SOUL.md
                     (read by every skill first)
                                 │
     ┌──────────────┬───────────┼───────────┬──────────────┐
     ▼              ▼           ▼           ▼              ▼
 ┌─────────┐   ┌─────────┐  ┌────────┐  ┌─────────┐   ┌──────────┐
 │ Content │   │  Video  │  │ Decks  │  │Pipeline │   │   Ops    │
 ├─────────┤   ├─────────┤  ├────────┤  ├─────────┤   ├──────────┤
 │content- │   │video-   │  │marketing│ │lead-gen │   │sop-writer│
 │creator  │   │script   │  │-deck    │ │account- │   │          │
 │linkedin-│   │         │  │proposal-│ │researcher│  │          │
 │post     │   │         │  │-deck    │ │         │   │          │
 │repurpos-│   │         │  │         │ │         │   │          │
 │ing-eng. │   │         │  │         │ │         │   │          │
 └────┬────┘   └────┬────┘  └───┬────┘  └────┬────┘   └────┬─────┘
      └─────────────┴───────────┴───────────┴─────────────┘
                                 │
                          ┌──────▼───────┐
                          │output-reviewer│  (5-check gate before ship)
                          └──────────────┘
```

See each skill's **Related Skills** section for the full map.

## Available Skills

<!-- SKILLS:START -->
| Skill | Description |
|-------|-------------|
| [content-creator](skills/content-creator/) | Long- or short-form marketing content — blogs, newsletters, threads, landing copy — from a brief. |
| [linkedin-post](skills/linkedin-post/) | LinkedIn posts and carousels in the founder's personal voice (reads SOUL.md). |
| [video-script](skills/video-script/) | Short-form (Reel/TikTok/Short) and YouTube scripts with hooks, shot list, and on-screen text. |
| [marketing-deck](skills/marketing-deck/) | Marketing / pitch / webinar decks, slide-by-slide, around a single takeaway. |
| [proposal-deck](skills/proposal-deck/) | 1:1 sales proposal decks tailored to a specific prospect. |
| [sop-writer](skills/sop-writer/) | Repeatable SOPs and playbooks a teammate can follow with zero context. |
| [lead-gen](skills/lead-gen/) | ICP-matched prospect lists with enrichment plan and A/B/C/D scoring. |
| [account-researcher](skills/account-researcher/) | One-page account brief: 90-day signals, buying committee, and angle (Firecrawl + Exa). |
| [repurposing-engine](skills/repurposing-engine/) | Turn one asset into 6–10 channel-native derivatives. |
| [output-reviewer](skills/output-reviewer/) | The 5-check quality gate every deliverable passes before shipping. |
<!-- SKILLS:END -->

## Installation

### Option 1: CLI install (recommended)

```bash
# Install all skills
npx skills add jaizendra/gtm-content-skills

# Install specific skills
npx skills add jaizendra/gtm-content-skills --skill content-creator linkedin-post

# List available skills
npx skills add jaizendra/gtm-content-skills --list
```

Installs to your `.agents/skills/` directory (and symlinks into `.claude/skills/` for Claude Code).

### Option 2: Claude Code plugin

```bash
/plugin marketplace add jaizendra/gtm-content-skills
/plugin install gtm-content-skills
```

### Option 3: Clone and copy

```bash
git clone https://github.com/jaizendra/gtm-content-skills.git
cp -r gtm-content-skills/skills/* .agents/skills/
```

## Usage

Once installed, just ask your agent:

```
"Write a LinkedIn carousel about AEO"        → linkedin-post
"Draft a proposal for Acme"                  → proposal-deck (+ account-researcher)
"Build a 5-lead list for B2B SaaS founders"  → lead-gen
"Write an SOP for our weekly content"        → sop-writer
"Is this draft ready to ship?"               → output-reviewer
```

Or invoke directly: `/content-creator`, `/linkedin-post`, `/output-reviewer`.

## Skill Categories

- **Content & Copy** — content-creator, linkedin-post, repurposing-engine
- **Video** — video-script
- **Decks** — marketing-deck, proposal-deck
- **Pipeline & Research** — lead-gen, account-researcher
- **Ops** — sop-writer
- **Quality** — output-reviewer

## License

[MIT](LICENSE) — use these however you want.
