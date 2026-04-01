---
name: decision-record
description: Document a product decision with full context — what was decided, alternatives considered, rationale, stakeholders, and downstream impact
---

## When to Use

After any significant product decision — feature scoping, priority changes, architectural choices, trade-offs, scope cuts, or direction changes.

## Instructions

### 1. Capture the decision

Ask the PM:
- **What was decided?** (one clear statement)
- **What triggered this decision?** (customer feedback, technical constraint, strategic shift)
- **What alternatives were considered?** (at least 2, ideally 3+)
- **Why was this option chosen?** (criteria, trade-offs)
- **Who was involved?** (decision maker, consulted, informed)
- **What does this affect?** (epics, teams, timelines, customers)

### 2. Draft the record

```
## Decision Record: [Decision Title]

**Date**: <date>
**Status**: Decided / Proposed / Superseded
**Decision maker**: [Name/role]

### Context
[What prompted this decision — the problem or question]

### Decision
[Clear statement of what was decided]

### Alternatives Considered

| Option | Pros | Cons |
|--------|------|------|
| **[Chosen option]** | ... | ... |
| [Alternative A] | ... | ... |
| [Alternative B] | ... | ... |

### Rationale
[Why the chosen option won — which criteria mattered most]

### Consequences
- **Epics affected**: [List with links]
- **Timeline impact**: [Acceleration, delay, or neutral]
- **Teams affected**: [Who needs to know]
- **Customer impact**: [Visible change, migration needed, or transparent]

### Stakeholders
| Role | Name | Status |
|------|------|--------|
| Decision maker | ... | Decided |
| Consulted | ... | Agreed / Disagreed |
| Informed | ... | Notified / Pending |
```

### 3. Store the record

Ask the PM where to put it:
- As a Jira comment on the relevant epic
- As a Confluence page
- As a local file in the repo

Present for review before posting.
