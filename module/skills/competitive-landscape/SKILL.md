---
name: competitive-landscape
description: Map competitors in a specific capability area — their strengths, weaknesses, positioning, and how our product compares
---

## When to Use

When the PM needs to understand competitive positioning for a feature area, prepare for a strategy discussion, or respond to "why don't we have what X has?"

## Instructions

### 1. Define the scope

Ask the PM:
- **Capability area**: What specific area are we comparing? (e.g., "container registry performance", "RBAC model", "CDN integration")
- **Competitors**: Who should we compare against? Or should we identify them?
- **Purpose**: Strategic planning? Customer question? RFP response? Feature prioritization?

### 2. Gather information

For each competitor, research:
- **What they offer** in this capability area
- **How it works** (architecture, approach, user experience)
- **Strengths**: What they do well
- **Weaknesses**: What they don't do well or don't support
- **Pricing/availability**: Open source? Paid? Enterprise-only?
- **Market perception**: How are they positioned?

Also check our own product:
- Query Jira for existing or planned epics in this area
- Review current capabilities

### 3. Build the comparison

```
## Competitive Landscape: [Capability Area]

### Our Position
- **Current state**: [What we offer today]
- **Planned**: [Relevant epics on the roadmap]
- **Strengths**: [Where we're ahead]
- **Gaps**: [Where we're behind]

### Competitor Comparison

| Capability | Us | Competitor A | Competitor B | Competitor C |
|------------|-----|-------------|-------------|-------------|
| [Capability 1] | ✅/⚠️/❌ | ... | ... | ... |
| [Capability 2] | ... | ... | ... | ... |

### Detailed Analysis

#### [Competitor A]
- **Approach**: [How they solve it]
- **Strengths**: [What they do well]
- **Weaknesses**: [What they don't do well]
- **Key differentiator**: [What makes them unique]

#### [Competitor B]
...

### Strategic Implications
- **Where we lead**: [Capabilities where we have an advantage]
- **Where we trail**: [Gaps that matter to customers]
- **Where it doesn't matter**: [Differences that aren't meaningful to our segment]

### Recommendations
1. [Invest in X because...]
2. [Don't pursue Y because...]
3. [Monitor Z because...]
```

Present to the PM for accuracy check and strategic interpretation.
