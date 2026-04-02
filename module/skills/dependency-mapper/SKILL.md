---
name: dependency-mapper
description: Identify cross-epic and cross-team dependency chains, flag blocked chains, and highlight tickets blocking the most downstream work
---

## When to Use

When the PO needs to understand what's blocking what, before planning, or when a critical issue is blocked and they need to trace the chain.

## Instructions

Read `local/jira-workflow.md` to understand blocking conventions (flags, issue links, or both).

### 1. Determine scope

Ask the PO:
- All active issues? A specific epic? A specific blocked ticket?
- Cross-project dependencies too, or just within this project?

### 2. Query dependencies

**Blocked issues**:
```
project = <PROJECT> AND cf[10517] = "True" ORDER BY priority ASC
```
(Adjust based on workflow config.)

For each blocked issue, retrieve its issue links to find what's blocking it. Then check if the blocker is itself blocked — trace the full chain.

Also check **parent-child relationships**: if all sub-issues of an epic are blocked, the epic is effectively blocked even without a flag.

### 3. Build dependency map

For each dependency chain:

```
ISSUE-100 (Blocker, In Progress)
  └── blocks → ISSUE-200 (Blocked, Major)
      └── blocks → ISSUE-300 (Blocked, Critical)
          └── blocks → ISSUE-400 (Blocked, Critical)
```

### 4. Identify high-impact blockers

Rank blockers by how many downstream issues they affect:

```
## Dependency Report — <date>

### Highest-Impact Blockers
| Blocker | Status | Assignee | Downstream Issues | Downstream Priority |
|---------|--------|----------|-------------------|---------------------|
| ISSUE-100 | In Progress | @alice | 3 | 2 Critical, 1 Major |
| ISSUE-567 | New | unassigned | 2 | 1 Major, 1 Normal |

### Dependency Chains
[Show each chain as a tree, as above]

### Unblocking Recommendations
- ISSUE-100: Assigned, in progress — check with @alice on ETA
- ISSUE-567: **Unassigned and New** — needs immediate attention, blocking 2 issues

### Orphaned Blocks
[Issues marked as blocked but with no blocking link — may be stale]
```

Present to the PO with recommended unblocking actions.
