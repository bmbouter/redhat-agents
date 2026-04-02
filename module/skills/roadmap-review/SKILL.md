---
name: roadmap-review
description: Analyze the current roadmap for problems — overcommitment, timeline conflicts, undated epics, scope drift — and produce a health summary with recommendations
---

## When to Use

During planning cycles, before stakeholder reviews, or when the PM suspects the roadmap is drifting.

## Instructions

Read `local/jira-workflow.md` to understand epic conventions and target date custom fields.

### 1. Query all active epics

```
project = <PROJECT> AND issuetype = Epic AND status != Closed ORDER BY cf[<target_start>] ASC
```

### 2. Analyze each epic

For each epic, gather:
- **Target dates**: start and end (from custom fields)
- **Sub-issue progress**: closed / total, status breakdown
- **Priority and assignment**
- **Description completeness**: Does it have goals, requirements, acceptance criteria?

### 3. Check for problems

- **No target dates**: Epics without start/end dates — invisible on the roadmap
- **Overcommitment**: Multiple high-priority epics with overlapping timelines and shared assignees
- **Timeline conflicts**: Epic A depends on Epic B, but A's start date is before B's end date
- **Stalled epics**: Target end date approaching but sub-issue progress is low
- **Scope drift**: Epics where sub-issue count has grown significantly since target dates were set
- **Orphaned work**: Active sub-issues whose parent epic is closed or has no dates

### 4. Present findings

```
## Roadmap Health Review — <date>

### Active Epics: X total

### Healthy (Y)
| Epic | Progress | Target | Status |
|------|----------|--------|--------|
| ... | ... | ... | On track |

### At Risk (Z)
| Epic | Progress | Target | Issue |
|------|----------|--------|-------|
| EPIC-123 | 20% | Ends Apr 25 | Only 9 days left, 80% remaining |
| EPIC-456 | 60% | Ends May 1 | Blocked by EPIC-789 which ends May 15 |

### Missing Dates (N)
- EPIC-012 — "Title" — no target dates set

### Overcommitment
- @alice is lead on 3 overlapping epics (EPIC-A, EPIC-B, EPIC-C)

### Recommendations
1. [Specific, actionable recommendation]
2. [...]
```
