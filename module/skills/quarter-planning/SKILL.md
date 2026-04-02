---
name: quarter-planning
description: Help plan an upcoming quarter — review candidate epics, estimate scope, identify dependencies, and draft a proposed timeline
---

## When to Use

At the start of a planning cycle, typically before a quarter begins.

## Instructions

Read `local/jira-workflow.md` to understand epic conventions, target date fields, and issue hierarchy.

### 1. Understand goals

Ask the PM:
- What quarter are we planning for? (dates)
- What are the top strategic goals or themes for this quarter?
- Are there any hard commitments or external deadlines?
- What capacity constraints should we consider? (team size, holidays, on-call rotation)

### 2. Review candidate epics

Query epics that could be planned:
- Existing epics without dates or with future dates
- Epics in New or In Progress status

```
project = <PROJECT> AND issuetype = Epic AND (status = New OR status = "In Progress") ORDER BY priority ASC
```

For each candidate, assess:
- **Scope**: How many sub-issues? Are they well-defined or still vague?
- **Dependencies**: Does this epic depend on another epic completing first?
- **Readiness**: Is the epic description complete? Are sub-issues filed?
- **Effort estimate**: Based on sub-issue count and complexity

### 3. Draft the quarter plan

```
## Q[N] Plan — <start date> to <end date>

### Strategic Goals
1. [Goal from PM input]
2. [...]

### Proposed Epics

| Priority | Epic | Scope | Target Start | Target End | Dependencies | Lead |
|----------|------|-------|-------------|-----------|--------------|------|
| 1 | EPIC-123 | 8 issues | <date> | <date> | None | @alice |
| 2 | EPIC-456 | 12 issues | <date> | <date> | After EPIC-123 | @bob |

### Capacity Notes
- [Any capacity constraints or conflicts]

### Risks
- [Dependency risks, scope uncertainty, etc.]

### Not This Quarter
| Epic | Reason |
|------|--------|
| EPIC-789 | Depends on EPIC-456 completing first |
| EPIC-012 | Low priority relative to goals |
```

Review with the PM. Once approved, offer to set target dates on the epics in Jira.
