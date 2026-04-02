---
name: customer-signal-aggregator
description: Search Jira for patterns across customer-reported issues — group by theme, identify most-requested capabilities, surface trends
---

## When to Use

When the PM wants to understand what customers are asking for, what pain points keep recurring, or where demand is clustering.

## Instructions

Read `local/jira-workflow.md` to understand issue types, labels, and components.

### 1. Define the search scope

Ask the PM:
- **Area of interest**: A specific feature area? Component? Epic? Or everything?
- **Time period**: Last quarter? Last 6 months? All time?
- **Signal types**: Bugs only? Feature requests? Support escalations? All?

### 2. Search broadly

Run multiple Jira queries to gather signals:

**Recent bugs in the area:**
```
project = <PROJECT> AND issuetype = Bug AND created >= "<start_date>" ORDER BY created DESC
```

**Feature requests / tasks:**
```
project = <PROJECT> AND issuetype in (Task, Story) AND created >= "<start_date>" ORDER BY created DESC
```

**Issues with specific keywords** (if the PM gave a topic):
```
project = <PROJECT> AND text ~ "<keywords>" ORDER BY created DESC
```

Read the summaries and descriptions to understand what each issue is actually about.

### 3. Identify themes

Group related issues by theme. A theme is a cluster of issues pointing at the same underlying need, even if they use different words.

For each theme, note:
- How many issues
- How many distinct reporters
- Severity distribution
- Whether any existing epics address it
- Whether it's getting better or worse over time

### 4. Present findings

```
## Customer Signal Analysis — <area> — <period>

### Top Themes

#### 1. [Theme name] (X issues, Y reporters)
- **Pattern**: [What customers are experiencing]
- **Examples**: ISSUE-123, ISSUE-456, ISSUE-789
- **Severity**: X Critical, Y Major, Z Normal
- **Existing coverage**: [Related epic or "none"]
- **Trend**: Growing / Stable / Declining

#### 2. [Theme name] (X issues, Y reporters)
...

### Signals Without a Clear Theme
- ISSUE-012 — [One-off request worth noting]

### Recommendations
- [Theme 1 warrants a new epic — no existing coverage]
- [Theme 2 is addressed by EPIC-XXX but progress is slow]
- [Theme 3 is declining — may resolve with upcoming release]
```
