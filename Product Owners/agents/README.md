# Agents

Agent definitions for the Product Owner role.

Each file defines an agent persona — its purpose, available tools, behavioral guidelines, and integration points.

## File Format

Agent files are Markdown with YAML frontmatter:

```markdown
---
name: agent-name
description: One-line summary of what this agent does
tools: [list, of, tools]
---

## Purpose

What this agent is for and when to use it.

## Behavior

How the agent should act, what it prioritizes, constraints it follows.
```
