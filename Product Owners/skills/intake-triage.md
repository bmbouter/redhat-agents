---
name: intake-triage
description: Classify a new or unrefined Jira ticket — determine issue type, search for duplicates, suggest component/label/priority, and recommend parent epic
---

## When to Use

When a new ticket comes in, or when reviewing unrefined issues in the backlog.

## Instructions

Read `local/jira-workflow.md` to understand issue types, required fields, and conventions.

### 1. Read the ticket

Get the full ticket details — summary, description, reporter, any comments or attachments.

### 2. Classify issue type

Apply the workflow config's decision rules:

- Is it broken behavior that was supposed to work? → **Bug**
- Is it a group of related work items? → **Epic**
- Is it a specific piece of work? → **Task**
- Apply any project-specific rules from the workflow config.

If the current type is wrong, recommend the correct type.

### 3. Search for duplicates

Search for issues with similar summaries or descriptions:

```
project = <PROJECT> AND summary ~ "<key terms>" ORDER BY created DESC
```

If potential duplicates exist, list them with similarity reasoning. Let the PO decide whether to close as duplicate.

### 4. Suggest field values

Based on the workflow config's required fields and defaults, suggest:

- **Priority**: Based on the description's urgency/impact language
- **Component**: Based on the area of the product affected
- **Labels**: Any that should always be applied
- **Parent epic**: Search for related epics and suggest the best fit

### 5. Present triage summary

```
## Triage: ISSUE-123

**Current**: Type=Task, Priority=unset, Component=none, Parent=none

**Recommended**:
- Type: Bug (description says "this used to work and now it doesn't")
- Priority: Major (affects user-facing functionality)
- Component: services
- Parent epic: EPIC-456 ("Authentication improvements")
- Duplicates: None found

**Missing fields**: acceptance criteria, description needs more detail

**Suggested next action**: Set fields and move to Refinement
```

Wait for PO approval before making any changes.
