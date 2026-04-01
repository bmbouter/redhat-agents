---
name: epic-health
description: Report on epic completion, velocity, at-risk tickets, and estimated time to completion for one or all active epics
---

## When to Use

When the PO wants to check progress on epics, during planning, or for stakeholder updates.

## Instructions

Read `local/jira-workflow.md` to understand epic conventions, statuses, and custom fields (target dates, blocked flags).

### 1. Identify epics

Ask the PO: specific epic(s) or all active epics?

For all active epics:
```
project = <PROJECT> AND issuetype = Epic AND status != Closed ORDER BY priority ASC
```

### 2. Analyze each epic

For each epic, query its sub-issues:
```
parent = <EPIC_KEY> ORDER BY status ASC, priority ASC
```

Calculate:

- **Completion**: Count of closed sub-issues vs total. Show as percentage and ratio (e.g., "7/12 — 58%").
- **Status breakdown**: How many in each status (New, Refinement, In Progress, Closed).
- **At-risk issues**:
  - In Progress for too long (define "too long" from workflow config or default to 5+ business days)
  - Blocked issues
  - Unassigned issues in active statuses
- **Target dates**: If the epic has target start/end dates, compare against current progress. Is it on track?
- **Recent activity**: Any sub-issues updated in the last 7 days? If none, the epic may be stalled.

### 3. Present report

```
## Epic Health Report — <date>

### EPIC-123: "Epic Title"
- **Progress**: 7/12 (58%)
- **Status**: 2 New, 1 Refinement, 2 In Progress, 7 Closed
- **Target dates**: Apr 7 – Apr 25 (9 business days remaining)
- **On track**: ⚠️ At risk — 5 issues remain with 9 days left
- **At-risk issues**:
  - ISSUE-456 — In Progress 8 days, no recent updates
  - ISSUE-789 — Blocked by ISSUE-012
- **Unassigned**: ISSUE-345 (Refinement)

### Summary across all epics
| Epic | Progress | Target End | Status |
|------|----------|------------|--------|
| EPIC-123 | 58% | Apr 25 | ⚠️ At risk |
| EPIC-456 | 90% | Apr 18 | ✅ On track |
| EPIC-789 | 20% | May 15 | 🔴 Behind |
```

Offer to drill into any specific epic or issue.
