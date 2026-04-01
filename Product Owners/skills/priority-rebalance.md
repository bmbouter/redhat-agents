---
name: priority-rebalance
description: Review priority assignments across the backlog and suggest reordering based on age, dependencies, blockers, and business goals
---

## When to Use

When the PO suspects priorities are stale, after a planning shift, or on a regular cadence.

## Instructions

Read `local/jira-workflow.md` to understand priority values and conventions.

### 1. Query prioritized backlog

Pull all non-closed issues, grouped by current priority:

```
project = <PROJECT> AND status != Closed ORDER BY priority ASC, updated DESC
```

### 2. Analyze each priority tier

For each priority level (Blocker, Critical, Major, Normal, Minor), check:

- **Inflation**: Are there too many Blockers/Criticals? More than ~10% of the backlog at Blocker/Critical suggests priority inflation.
- **Age vs priority**: High-priority items that have been open for a long time without progress may need escalation or re-assessment.
- **Blocking chains**: Issues that block multiple other issues may deserve a priority bump regardless of their current level.
- **Stale highs**: Blocker/Critical issues with no recent updates — are they still urgent?
- **Buried lows**: Minor/Normal issues that are actually blocking high-priority work.

### 3. Present recommendations

```
## Priority Rebalance Suggestions — <date>

### Priority Inflation
- X of Y open issues are Blocker/Critical (Z%)
- Recommendation: Review these for downgrade...

### Suggested Upgrades
- ISSUE-123 (currently Normal) → Major
  - Reason: Blocks 3 other in-progress issues

### Suggested Downgrades
- ISSUE-456 (currently Blocker) → Major
  - Reason: No updates in 30 days, no downstream blockers

### Stale High-Priority
- ISSUE-789 (Blocker) — last updated 21 days ago
  - Still a blocker? Needs PO decision.

### Summary
- Current distribution: X Blocker, Y Critical, Z Major, ...
- Suggested distribution: ...
```

All changes require PO approval. Offer to apply approved changes via Jira API.
