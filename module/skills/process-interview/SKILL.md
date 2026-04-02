---
name: process-interview
description: Interview the user about their Jira workflow and generate a local jira-workflow.md config file that all agents reference
---

## When to Use

Run this after `/jira-setup` and before using any Jira-connected agents. Re-run whenever the team's Jira process changes.

## Instructions

Interview the user about their Jira project setup. Ask questions conversationally — don't dump all questions at once. Group them into natural topics and confirm understanding before moving on.

If the user says they have existing documentation about their workflow, ask them to point you to it. Read it and use it to pre-fill answers, then confirm the details with the user.

### Topic 1: Project Basics

- What is your Jira project key? (e.g., `MYPROJECT`, `ACME`)
- What is your Jira instance URL? (e.g., `https://yourcompany.atlassian.net`)
- Does your project use components? If so, which component(s) should always be set?
- Do you have a board? What type — Kanban or Scrum?
- Link to the board? (optional)
- Link to the roadmap? (optional)

### Topic 2: Issue Types and Hierarchy

- What issue types does your project use? (Epic, Story, Task, Bug, Sub-task, etc.)
- Are there any issue types you explicitly do NOT use?
- Are sub-issues used under epics? If so, what types? (Tasks, Stories, Bugs?)
- Are standalone issues (no parent epic) common or exceptional?
- Do you use Sub-tasks under Stories/Tasks, or is the hierarchy flat (Epic → Task/Bug)?

### Topic 3: Workflow and Statuses

- What statuses does your project use? List them in lifecycle order.
- What is the typical issue lifecycle? (e.g., New → Refinement → In Progress → Closed)
- Are there any status-specific rules? (e.g., "Epics never go to Refinement")
- How does an issue get onto the board? (e.g., transition to a specific status?)
- What resolution values are used when closing? (Done, Won't Do, Duplicate, etc.)

### Topic 4: Required and Default Fields

- Are there fields that should ALWAYS be set on every issue? (priority, component, labels, etc.)
- What is the default priority? What priority values are available?
- Do you use labels? Any that should always be applied?
- Are there custom fields that are important? (e.g., "Blocked" flag, "Target start/end" dates)
  - If so, get the custom field IDs (e.g., `customfield_10517`)

### Topic 5: Story Points and Estimation

- Does your project use story points?
- If yes, what scale? (Fibonacci, t-shirt sizes, etc.)
- Are story points required or optional?
- Is there an estimation process? (planning poker, PO assigns, etc.)

### Topic 6: Blocking and Dependencies

- Do you track blocked issues? How?
  - A custom field flag?
  - Issue links (Blocks/Is blocked by)?
  - Both?
- Are cross-team or cross-epic dependencies tracked?
- Is there a blocked swimlane or view on the board?

### Topic 7: Epics

- How are epics managed differently from other issue types?
- Do epics use target start/end dates?
- Do epics have a description template?
- Who is typically assigned to an epic? (lead, PO, unassigned?)
- When should an epic be closed? (all sub-issues done? explicit decision?)

### Topic 8: API Gotchas

- Are there any known quirks with the Jira API for your project?
  - Fields that are silently dropped on create?
  - Fields that require a follow-up edit call?
  - Transitions that need specific field values?

Ask the user if there's anything else about their process that the agents should know.

## Output

After the interview, generate `local/jira-workflow.md` in the repo root. Use the structure below, filling in all sections with the user's answers. For any section where the user said "we don't use this," explicitly note that so agents don't guess.

```markdown
# Jira Workflow Configuration

## Project Defaults

| Field | Value |
|-------|-------|
| Project | `PROJECT_KEY` |
| Instance URL | `https://...` |
| Component | `component_name` (ID: ...) |
| Board | Kanban / Scrum |
| Board URL | ... |
| Roadmap URL | ... |

## Issue Types

| Type | Used? | Notes |
|------|-------|-------|
| Epic | Yes/No | ... |
| Story | Yes/No | ... |
| Task | Yes/No | ... |
| Bug | Yes/No | ... |
| Sub-task | Yes/No | ... |

### Hierarchy

[Describe the issue hierarchy and whether sub-issues under epics are used]

### Decision Rules

[How to determine which issue type to use]

## Workflow Statuses

| Status | Meaning |
|--------|---------|
| ... | ... |

### Typical Issue Lifecycle

[Status flow diagram]

### Epic Lifecycle

[If different from regular issues]

### Board Visibility

[How issues get on/off the board]

## Required Fields

[Fields that must always be set, with default values]

## Custom Fields

| Field | Custom Field ID | Notes |
|-------|-----------------|-------|
| ... | ... | ... |

## Story Points

[Whether used, scale, process — or "Not used"]

## Blocking and Dependencies

[How blocking is tracked — flags, links, both, neither]

## Epic Conventions

[Template, assignment, closure rules, target dates]

## API Gotchas

[Any known API quirks — fields dropped on create, required follow-up edits, etc.]

## Additional Notes

[Anything else the user mentioned]
```

Show the generated file to the user for review before writing it. Make adjustments if they request changes.
