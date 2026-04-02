---
name: roadmap-brief
description: Generate a stakeholder-ready roadmap summary — translates Jira epic data into narrative form tailored to the audience
---

## When to Use

When the PM needs to communicate the roadmap to stakeholders, leadership, or customers.

## Instructions

Read `local/jira-workflow.md` to understand epic conventions.

### 1. Determine audience and format

Ask the PM:
- **Audience**: Engineering leadership? Executives? Customers? Cross-team partners?
- **Format**: Slide deck bullet points? Email? Confluence page? Slack post?
- **Focus**: Full roadmap? Specific quarter? Specific theme?
- **What changed**: Any recent shifts to highlight?

### 2. Query roadmap data

Pull active and upcoming epics with their target dates and progress.

### 3. Generate the brief

Adapt tone and detail to the audience:

**For executives:**
- Lead with outcomes and business impact, not technical details
- 3-5 bullet points max per section
- Highlight what shipped, what's coming, what shifted and why
- Include key risks and decisions needed

**For engineering leadership:**
- Include progress percentages, team assignments, dependency chains
- Flag technical risks and resource constraints
- More detail on what's in progress and what's blocked

**For customers:**
- Focus on capabilities being delivered, not internal project details
- Use user-oriented language, not Jira ticket summaries
- Frame around problems being solved, not features being built
- Be careful with dates — use quarters or ranges, not specific dates

**For cross-team partners:**
- Highlight integration points and shared dependencies
- Call out what you need from them and when
- Show your timeline relative to their timeline

Present draft to the PM for tone and accuracy review before sharing.
