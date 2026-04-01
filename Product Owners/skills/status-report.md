---
name: status-report
description: Generate a stakeholder status report from Jira data — what shipped, what's in progress, what's blocked, key metrics
---

## When to Use

When the PO needs to produce a status update for stakeholders, management, or the team.

## Instructions

Read `local/jira-workflow.md` to understand statuses and conventions.

### 1. Ask about scope and format

- **Time period**: Last week? Last 2 weeks? Since a specific date?
- **Audience**: Team standup? Management? Stakeholders?
- **Format**: Slack message? Email? Confluence page?
- **Focus**: All work? Specific epics? Specific components?

### 2. Query Jira

**Recently closed** (shipped):
```
project = <PROJECT> AND status = Closed AND status changed to Closed after "<start_date>" ORDER BY resolved DESC
```

**Currently in progress**:
```
project = <PROJECT> AND status = "In Progress" ORDER BY priority ASC
```

**Currently blocked**:
```
project = <PROJECT> AND cf[10517] = "True" ORDER BY priority ASC
```
(Adjust the blocked query based on the workflow config's blocking mechanism.)

**New issues filed** in the period:
```
project = <PROJECT> AND created >= "<start_date>" ORDER BY created DESC
```

### 3. Generate report

Adapt the format to the audience:

**For stakeholders / management:**
```
## Status Report — <period>

### Completed
- [Brief description of key items shipped, grouped by epic if relevant]

### In Progress
- [Key items being worked on, with assignees]

### Blocked / At Risk
- [Blocked items with reason and what's needed to unblock]

### Metrics
- Closed: X issues
- Opened: Y issues
- Net: +/- Z
- Currently blocked: N

### Key Decisions Needed
- [Any items requiring stakeholder input]
```

**For team Slack:**
Keep it concise — 5-10 lines max, bullet points, link to tickets.

Show the draft to the PO for review before sending or publishing.
