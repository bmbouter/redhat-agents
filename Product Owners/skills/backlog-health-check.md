---
name: backlog-health-check
description: Scan the Jira backlog for problems — stale tickets, missing fields, duplicates, wrong statuses — and produce a summary with suggested fixes
---

## When to Use

When the PO wants to clean up the backlog, before grooming, or on a regular cadence.

## Instructions

Read `local/jira-workflow.md` to understand required fields, statuses, and conventions.

### 1. Query open issues

Pull all non-closed issues in the project. Use JQL:

```
project = <PROJECT> AND status != Closed ORDER BY updated ASC
```

### 2. Check for problems

For each issue, check:

- **Stale**: Not updated in 14+ days while in an active status (In Progress, Refinement). Flag with days-since-update.
- **Missing required fields**: Check against the required fields from the workflow config (priority, component, description, acceptance criteria, etc.).
- **Orphaned**: Non-epic issues without a parent epic, if the workflow config says sub-issues under epics are the norm.
- **Wrong status**: Issues that appear stuck — e.g., "In Progress" with no assignee, or "New" for 30+ days.
- **Potential duplicates**: Issues with very similar summaries. Group candidates.

### 3. Report

Present findings grouped by problem type:

```
## Backlog Health Report — <date>

### Stale Issues (no update in 14+ days)
- ISSUE-123 — "Summary" — 23 days stale, status: In Progress, assignee: @person

### Missing Fields
- ISSUE-456 — missing: component, acceptance criteria
- ISSUE-789 — missing: priority

### Orphaned Issues (no parent epic)
- ISSUE-012 — "Summary"

### Possible Duplicates
- Group 1: ISSUE-111, ISSUE-222 — both about "widget rendering"

### Summary
- X issues checked
- Y problems found
- Z issues are healthy
```

Ask the PO which items they want to address and help fix them.
