---
name: acceptance-criteria-writer
description: Draft structured acceptance criteria for a Jira ticket based on its description, comments, and conversation context
---

## When to Use

When a ticket needs acceptance criteria before it can be refined or worked on.

## Instructions

Read `local/jira-workflow.md` to understand any AC format conventions.

### 1. Understand the requirement

Read the ticket's summary, description, and any comments. If the description is vague, ask the PO clarifying questions before drafting.

### 2. Draft acceptance criteria

Use the format from the workflow config. If no format is specified, default to a checklist format:

```
h3. Acceptance Criteria

* [ ] [Criterion 1 — specific, testable outcome]
* [ ] [Criterion 2]
* [ ] [Criterion 3]
```

For complex requirements, use Given/When/Then:

```
h3. Acceptance Criteria

* Given [precondition], when [action], then [expected result]
* Given [precondition], when [action], then [expected result]
```

### Guidelines

- Each criterion must be **testable** — someone should be able to verify pass/fail.
- Cover the **happy path** and key **edge cases**.
- Include **negative cases** where relevant (what should NOT happen).
- Don't over-specify implementation details — describe outcomes, not code.
- Keep it concise — 3-7 criteria for a typical ticket.

### 3. Present for review

Show the drafted AC to the PO. Iterate based on feedback. Once approved, offer to update the ticket in Jira.
