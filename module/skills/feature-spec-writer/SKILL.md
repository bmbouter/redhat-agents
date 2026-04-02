---
name: feature-spec-writer
description: Take unstructured input (notes, requests, conversations) and produce a structured feature specification using the project's epic template
---

## When to Use

When the PM has a feature idea, customer request, or stakeholder conversation that needs to be turned into a formal spec.

## Instructions

Read `local/jira-workflow.md` to understand the epic description template and field conventions.

### 1. Gather input

Ask the PM for the raw input — this could be:
- Conversation notes or meeting minutes
- A customer request or support escalation
- A Slack thread or email
- A verbal description of what they want

### 2. Ask clarifying questions

Before writing, make sure you understand:
- **Who** has this problem? (customer segment, persona)
- **What** is the problem? (not the solution — the underlying need)
- **Why** does it matter? (business impact, strategic alignment)
- **What does success look like?** (measurable outcomes)
- **What's out of scope?** (boundaries)

### 3. Draft the spec

Use the epic description template from the workflow config. If none exists, use this structure:

```
h2. Functionality Overview

[High-level description of what this feature delivers]

h2. Problem Statement

[The specific customer/market problem this addresses]

h2. Goals

* [Goal 1 — measurable outcome]
* [Goal 2]

h2. Requirements

||Requirement||Notes||isMvp||
|[Requirement 1]|[Notes]|yes/no|
|[Requirement 2]|[Notes]|yes/no|

h2. Use Cases

* [Use case 1 — who does what and why]
* [Use case 2]

h2. Out of Scope

* [What is explicitly NOT included]

h2. Background and Strategic Fit

[Why this matters strategically]

h2. Assumptions

* [Key assumption 1]
* [Key assumption 2]

h2. Open Questions

|Question|Outcome|
|[Open question 1]|[Answer when resolved]|
```

### 4. Review and iterate

Present the spec to the PM. Iterate based on feedback. Once approved, offer to create the epic in Jira with the spec as the description.
