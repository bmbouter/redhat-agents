---
name: grooming-report
description: Record every backlog grooming action to an append-only audit log and render a human-readable Markdown report of each grooming session
---

## When to Use

During and after a backlog grooming session. Use this alongside `grooming-prep`
and `backlog-health-check`: those decide *what* to do, this one keeps a durable
record of *what was done* so sessions are auditable and reviewable.

## Why

Grooming touches many tickets across a session. Without a record, there is no way
to answer "what changed last Tuesday?", to review automated actions after the fact,
or to hand a summary to the team. This skill maintains a machine-readable audit
trail and turns it into a report the PO and team can read.

## Where the Files Live

Keep the audit trail in the gitignored `local/` directory so it stays with the
user's workflow config and out of version control:

- `local/grooming_log.jsonl` — append-only audit trail (one JSON object per line)
- `local/grooming_report.md` — generated report (do not edit by hand)

## Instructions

Read `local/jira-workflow.md` first to understand the project's conventions
(issue types, hierarchy, required fields, status names).

### 1. Mark the start of the session

Before making any changes, append a session marker to
`local/grooming_log.jsonl`:

```jsonl
{"session_start": "YYYY-MM-DD", "groomer": "Name", "total_issues": N, "analyzed": M, "note": "what this session focused on"}
```

- `total_issues` — how many issues matched the grooming query
- `analyzed` — how many you actually reviewed this session

### 2. Log every action as you go

Append one line per action. Use a small, consistent set of `action` values so
the report stays scannable. Common actions:

```jsonl
{"issue": "KEY-123", "action": "updated", "changes": ["added_label_X", "assigned_to_parent_KEY-100"], "notes": "context", "timestamp": "ISO8601"}
{"issue": "KEY-456", "action": "postponed_for_team_review", "reason": "needs_team_input_on_priority", "timestamp": "ISO8601"}
{"action": "created_epic", "issue": "KEY-789", "summary": "Epic title", "parent": "PARENT-KEY", "timestamp": "ISO8601"}
{"action": "created_feature", "issue": "KEY-790", "summary": "Feature title", "parent": "PARENT-KEY", "timestamp": "ISO8601"}
```

Field conventions the report understands:

- `issue` / `issues` — a single key or an array of keys the action applies to
- `action` — the verb (`updated`, `postponed_for_team_review`, `created_epic`,
  `created_feature`, or any project-specific verb)
- `changes` — array (or string) of concrete changes made
- `notes` / `reason` — free-text context; the report falls back to whichever is present
- `summary` / `parent` — used for `created_*` actions
- `timestamp` — ISO 8601, when the action happened

Only log actions that actually succeeded. If a change failed, note it in `notes`.

### 3. Close out the session (optional)

A summary line is convenient for at-a-glance totals:

```jsonl
{"summary": "grooming_complete", "total_processed": N, "epics_created": N, "postponed": N, "timestamp": "ISO8601"}
```

Lines without an `action` and without `issue`/`issues`/`features` are skipped by
the report generator, so summary-only lines are safe to include.

### 4. Generate the report

Run the bundled script to render the log as Markdown:

```bash
./generate-md-report.sh local/grooming_log.jsonl local/grooming_report.md
```

It groups entries by session and produces a table of actions per session. The
script requires `jq`. Both arguments are optional and default to
`grooming_log.jsonl` / `grooming_report.md` in the current directory.

### 5. Report back to the PO

Point the PO at `local/grooming_report.md` and give a one-paragraph summary of the
session: how many issues were analyzed, what was changed automatically, and what
was postponed for team review.
