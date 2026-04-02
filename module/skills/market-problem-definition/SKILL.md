---
name: market-problem-definition
description: Structure a market problem — customer segments, pain points, current alternatives, desired outcomes, and opportunity sizing
---

## When to Use

When the PM is exploring a new product direction, evaluating a feature area, or needs to articulate the market problem behind a set of customer requests.

## Instructions

### 1. Start with the raw signal

Ask the PM what triggered this analysis:
- Customer feedback or requests?
- Competitive pressure?
- Strategic initiative from leadership?
- Emerging market trend?

### 2. Interview to build the problem definition

Walk through each dimension. Ask questions conversationally — don't dump a form.

**Customer segments:**
- Who experiences this problem? Be specific — not "developers" but "platform engineers managing 50+ microservices."
- Are there distinct segments with different versions of the problem?
- Which segment is most underserved?

**Pain points:**
- What specifically is painful today? How do they work around it?
- What triggers the pain? (frequency, severity, context)
- What does it cost them? (time, money, reliability, developer experience)

**Current alternatives:**
- How do they solve this today? (our product, competitor, manual process, nothing)
- What's good and bad about each alternative?
- Why haven't existing alternatives fully solved it?

**Desired outcomes:**
- What would "solved" look like from the customer's perspective?
- What would they be able to do that they can't do now?
- How would they measure success?

**Opportunity sizing:**
- How many customers/teams face this problem?
- Is the affected population growing or shrinking?
- Is this a blocker (must-have) or a nice-to-have?
- Any evidence from Jira? (query for related issues to quantify)

### 3. Produce the problem definition document

```
## Market Problem Definition: [Problem Name]

### Problem Statement
[One paragraph: who has this problem, what the problem is, and why it matters]

### Customer Segments
| Segment | Description | Severity | Size |
|---------|-------------|----------|------|
| [Segment 1] | ... | High/Med/Low | ... |

### Pain Points
1. [Pain point] — triggered by [context], costs [impact]
2. ...

### Current Alternatives
| Alternative | Strengths | Weaknesses |
|-------------|-----------|------------|
| [Current product capability] | ... | ... |
| [Competitor X] | ... | ... |
| [Manual workaround] | ... | ... |

### Desired Outcomes
- [Outcome 1 — measurable]
- [Outcome 2]

### Opportunity Assessment
- **Affected customers**: [estimate with evidence source]
- **Trend**: Growing / Stable / Declining
- **Blocker vs nice-to-have**: ...
- **Jira evidence**: X related issues from Y reporters (see customer-signal-aggregator output if available)

### Strategic Alignment
[How this connects to broader product/company strategy]

### Open Questions
- [What we don't know yet and how to find out]
```

Review with the PM and iterate.
