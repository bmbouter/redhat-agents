---
name: grooming-prep
description: Prepare a grooming session agenda for a set of tickets or an epic — groups related work, flags incomplete tickets, identifies questions to resolve
---

## When to Use

Before a backlog grooming or refinement session.

## Instructions

Read `local/jira-workflow.md` to understand the project's conventions.

### 1. Gather tickets

Ask the PO what to groom:
- A specific epic and its sub-issues?
- All issues in "New" status?
- A specific set of ticket keys?

Query the relevant issues from Jira.

### 2. Assess readiness

For each ticket, evaluate:

- **Description quality**: Is there enough detail to understand the work?
- **Acceptance criteria**: Present and testable?
- **Dependencies**: Are blockers or related issues identified?
- **Estimation**: If story points are used, is it estimated?
- **Type correctness**: Is the issue type right per the workflow config's decision rules?

Classify each ticket as:
- **Ready** — can be discussed and moved to Refinement
- **Needs work** — has gaps that should be filled before or during grooming
- **Blocked** — has unresolved dependencies or questions

### 3. Produce agenda

```
## Grooming Agenda — <date>

### Context
[Epic name or theme being groomed]

### Ready for Refinement (X tickets)
1. ISSUE-123 — "Summary" — priority: Major
2. ISSUE-456 — "Summary" — priority: Normal

### Needs Discussion (Y tickets)
1. ISSUE-789 — "Summary"
   - Missing: acceptance criteria
   - Question: Is this blocked by ISSUE-012?

### Blocked (Z tickets)
1. ISSUE-345 — "Summary"
   - Blocked by: ISSUE-678 (still in progress)

### Suggested Discussion Order
[Order tickets by dependency chain, then priority]

### Open Questions
- [Questions that came up during analysis]
```

Present to the PO for review. Adjust order or grouping as requested.
