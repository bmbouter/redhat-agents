---
name: opportunity-assessment
description: Evaluate a potential feature or product direction against market signals, customer demand, competitive gaps, and strategic fit
---

## When to Use

When the PM is deciding whether to invest in a feature area, comparing multiple potential initiatives, or building a business case for a new epic.

## Instructions

Read `local/jira-workflow.md` to understand epic conventions and current roadmap structure.

### 1. Define the opportunity

Ask the PM:
- **What is being proposed?** (feature, capability, product direction)
- **Who is asking for it?** (customers, leadership, competitive pressure, internal need)
- **What's the hypothesis?** (if we build X, then Y will happen)

### 2. Evaluate across dimensions

**Customer demand:**
- Search Jira for related issues — how many, from how many reporters, over what time period?
- Are customers asking for this directly, or would it solve problems they're reporting?
- Is demand growing, stable, or one-time?

**Competitive positioning:**
- Do competitors offer this? Is it a differentiator or table stakes?
- Would building this close a gap or create a lead?

**Strategic alignment:**
- Does this support stated product/company goals?
- Does it align with where the market is heading?
- Does it strengthen our core or distract from it?

**Effort and feasibility:**
- If related epics or sub-issues exist, what's the estimated scope?
- Are there technical prerequisites or dependencies?
- Does the team have the expertise?

**Risk:**
- What happens if we build it and it doesn't get adopted?
- What happens if we don't build it?
- Are there compliance, security, or operational risks?

### 3. Score and present

```
## Opportunity Assessment: [Opportunity Name]

### Summary
[One paragraph: what it is, why it's being considered, and the recommendation]

### Scorecard
| Dimension | Score (1-5) | Evidence |
|-----------|-------------|----------|
| Customer demand | X | Y issues from Z reporters |
| Competitive necessity | X | [Gap/lead/parity] |
| Strategic alignment | X | [Supports/neutral/conflicts with goals] |
| Feasibility | X | [Estimated scope, prerequisites] |
| Risk | X | [Low/medium/high, key risks] |
| **Overall** | **X** | |

### Evidence Detail

#### Customer Demand
[Jira data, customer quotes, support trends]

#### Competitive Context
[Where competitors stand, market expectations]

#### Strategic Fit
[Connection to product strategy and company goals]

#### Feasibility
[Scope estimate, dependencies, team readiness]

#### Risks
[What could go wrong, mitigation options]

### Recommendation
[Build / Don't build / Investigate further / Defer]
- **If build**: Suggested priority, timeline, and first steps
- **If not**: Why, and what to tell requestors

### Comparison (if evaluating multiple opportunities)
| Opportunity | Demand | Competitive | Strategic | Feasibility | Risk | Overall |
|-------------|--------|-------------|-----------|-------------|------|---------|
| [A] | ... | ... | ... | ... | ... | ... |
| [B] | ... | ... | ... | ... | ... | ... |
```

Present to the PM for review and discussion.
