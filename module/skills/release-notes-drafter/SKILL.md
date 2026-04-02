---
name: release-notes-drafter
description: Generate customer-facing release notes from closed Jira epics and issues — user-oriented language, grouped by theme
---

## When to Use

At release time, or when the PM needs to communicate what shipped over a period.

## Instructions

Read `local/jira-workflow.md` to understand statuses and epic conventions.

### 1. Define the release scope

Ask the PM:
- **Time period or version**: Since last release? Specific date range? Version number?
- **Audience**: Internal team? Customers? Public changelog?
- **Format**: Markdown? Confluence? Email?

### 2. Query closed work

```
project = <PROJECT> AND status = Closed AND status changed to Closed after "<start_date>" ORDER BY issuetype ASC, resolved DESC
```

Group by parent epic where possible.

### 3. Translate to user language

For each item:
- Rewrite the Jira summary from technical language to user-oriented language
- Focus on **what the user can now do**, not what code changed
- For bug fixes, describe what was broken and that it's now fixed
- Skip purely internal/infrastructure changes unless they affect users

### 4. Draft the release notes

```
## Release Notes — [Version / Date]

### New Features
- **[Feature name]**: [What users can now do]. ([EPIC-123])

### Improvements
- **[Improvement]**: [What got better and why it matters]. ([ISSUE-456])

### Bug Fixes
- Fixed an issue where [user-visible symptom]. ([ISSUE-789])
- Fixed [another issue]. ([ISSUE-012])

### Known Issues
- [Any known issues to call out]
```

### 5. Flag items for review

Mark any items where:
- The user impact is unclear from the ticket
- The change might need a migration note or breaking change warning
- The summary was too technical to translate confidently

Present to the PM for review. Iterate before publishing.
