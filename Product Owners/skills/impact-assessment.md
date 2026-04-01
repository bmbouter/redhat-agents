---
name: impact-assessment
description: Evaluate a ticket's severity, urgency, and estimated effort — cross-reference related epics and recent incidents for context
---

## When to Use

When the PO needs to understand the impact of an issue before prioritizing it, especially for bugs and escalations.

## Instructions

Read `local/jira-workflow.md` to understand priority levels and blocking conventions.

### 1. Gather context

Read the full ticket. Also query:

- **Related issues**: Issues linked to this one, or under the same epic
- **Recent similar issues**: Search for recently closed issues in the same area
- **Blocking impact**: Is anything currently blocked by this issue?

### 2. Assess dimensions

Evaluate across three dimensions:

**Severity** — How bad is the impact?
- Critical: Data loss, security issue, or complete feature failure
- High: Major feature degraded, workaround exists but is painful
- Medium: Feature partially broken, reasonable workaround exists
- Low: Cosmetic, minor inconvenience, edge case

**Urgency** — How soon must it be fixed?
- Immediate: Actively causing problems in production
- Soon: Will cause problems if not addressed this iteration
- Normal: Should be planned but no immediate pressure
- Low: Can wait for a natural opportunity

**Effort** — How much work is it? (if estimable from the description)
- Large: Multiple days, cross-cutting changes
- Medium: A day or two, contained scope
- Small: Hours, single-area change
- Unknown: Not enough information to estimate

### 3. Present assessment

```
## Impact Assessment: ISSUE-123

**Severity**: High — user-facing feature is degraded
**Urgency**: Soon — reported by 3 users this week
**Effort**: Medium — likely a single-service fix based on error description

**Context**:
- Related to EPIC-456 (authentication improvements)
- Similar to ISSUE-100 (closed 2 weeks ago, different root cause)
- Currently blocking: ISSUE-789

**Recommended priority**: Major
**Recommended action**: Add to current iteration, assign to auth team
```

The PO decides the final priority and action.
