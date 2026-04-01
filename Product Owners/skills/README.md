# Skills

Reusable skills for the Product Owner role.

Skills are self-contained capabilities that can be invoked by agents or users. Each skill file describes a specific task or workflow.

## File Format

Skill files are Markdown with YAML frontmatter:

```markdown
---
name: skill-name
description: One-line summary — used to decide when this skill applies
---

## When to Use

Trigger conditions for this skill.

## Instructions

Step-by-step instructions the agent follows when this skill is invoked.
```

Skills with supporting files (style guides, templates) should use a subdirectory:

```
skills/
├── simple-skill.md
└── complex-skill/
    ├── SKILL.md
    └── supporting-file.md
```
