---
name: stakeholder-brief
description: Prepare concise executive summaries from Jira data and PM talking points — adapted for different audiences
---

## When to Use

When the PM needs to brief leadership, present at a review, or prepare talking points for a meeting.

## Instructions

Read `local/jira-workflow.md` to understand statuses, epic conventions, and metrics available.

### 1. Understand the context

Ask the PM:
- **Audience**: Who is this for? (VP, director, cross-team, skip-level)
- **Occasion**: Regular review? Escalation? Planning input? Ad-hoc ask?
- **Key message**: What's the one thing you want them to take away?
- **Talking points**: Any specific items to include or exclude?
- **Format**: Bullet points? Slide content? Written summary? Verbal prep notes?

### 2. Gather data

Query Jira for relevant metrics:
- Epic progress (completion percentages, timelines)
- Recent completions
- Current blockers / risks
- Headcount / capacity utilization (if visible in assignments)
- Trend data (issues opened vs closed over time)

### 3. Draft the brief

Adapt to audience:

**For executives (VP+):**
```
## [Team/Product] Brief — <date>

### Status: [Green / Yellow / Red]

### Key Takeaway
[One sentence — what they need to know]

### Progress Against Goals
| Goal | Status | Notes |
|------|--------|-------|
| [Q goal 1] | On track / At risk / Behind | [Brief context] |

### Risks Requiring Attention
- [Risk 1 — what it is, what you need from them]

### Decisions Needed
- [Decision 1 — options and recommendation]
```

**For engineering leadership:**
```
## [Team/Product] Update — <date>

### Completed Since Last Update
- [Item 1]

### In Progress
| Epic | Progress | ETA | Blockers |
|------|----------|-----|----------|
| ... | ... | ... | ... |

### Risks
- [Risk with specific impact and mitigation]

### Asks
- [What you need from them]
```

**For cross-team:**
```
## [Team/Product] — What You Need to Know

### What We're Working On
- [Items relevant to this audience]

### Dependencies on Your Team
- [Specific ask with timeline]

### Dependencies on Us
- [What they're waiting for and when]
```

Review with the PM. Adjust tone, detail, and emphasis as requested.
