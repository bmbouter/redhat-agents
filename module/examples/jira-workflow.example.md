# Jira Workflow Configuration

<!-- This is an example jira-workflow.md showing all sections that agents expect.
     Copy this file to your project root as jira-workflow.md (or local/jira-workflow.md)
     and fill in your team's values. All sections are consumed by at least one agent
     or skill — do not remove any sections. If a section doesn't apply to your team,
     keep the heading and write "Not used" so agents don't guess. -->

## Project Defaults

| Field | Value |
|-------|-------|
| Project | `MYPROJECT` |
| Instance URL | `https://redhat.atlassian.net` |
| Component | `my-component` (ID: 12345) |
| Board | Kanban |
| Board URL | https://redhat.atlassian.net/jira/software/projects/MYPROJECT/boards/100 |
| Roadmap URL | https://redhat.atlassian.net/jira/software/projects/MYPROJECT/boards/100/roadmap |

<!-- Used by: ALL agents — this is how they know which project to query -->

## Issue Types

| Type | Used? | Notes |
|------|-------|-------|
| Epic | Yes | Large features spanning multiple sprints/quarters |
| Story | No | We use Tasks instead |
| Task | Yes | Default work item under epics |
| Bug | Yes | Defects found in production or testing |
| Sub-task | No | Flat hierarchy — epics contain tasks and bugs directly |

<!-- Used by: intake-triager, requirements-analyst, intake-triage skill -->

### Hierarchy

Epic → Task / Bug (flat, no sub-tasks)

Standalone issues (no parent epic) are used only for urgent bugs and small operational tasks.

### Decision Rules

- **Epic**: Multi-week effort requiring multiple sub-issues. Has a clear goal and acceptance criteria.
- **Task**: A single unit of work, typically completable in a few days. Default for new work items.
- **Bug**: Something that's broken — a regression, defect, or incorrect behavior in production.

<!-- Used by: intake-triage skill for classification decisions -->

## Workflow Statuses

| Status | Meaning |
|--------|---------|
| New | Just created, not yet triaged |
| Refinement | On the board, being defined and estimated |
| In Progress | Actively being worked on |
| Code Review | Implementation complete, awaiting review |
| Closed | Done — resolved or won't-do |

<!-- Used by: delivery-tracker, status-report, release-notes-drafter, backlog-health-check -->

### Typical Issue Lifecycle

New → Refinement → In Progress → Code Review → Closed

Issues enter the board when transitioned to Refinement.

### Epic Lifecycle

New → In Progress → Closed

Epics skip Refinement. They move to In Progress when the first sub-issue starts. They close when all sub-issues are resolved or the PO explicitly closes them.

### Board Visibility

Issues appear on the board at Refinement status. Closed issues drop off automatically.

## Required Fields

Every issue must have:
- **Priority**: defaults to `Normal`. Values: `Blocker`, `Critical`, `Major`, `Normal`, `Minor`
- **Component**: always set to `my-component`
- **Labels**: optional, but use `urgent` for escalations
- **Assignee**: set when work begins, not at creation

<!-- Used by: backlog-health-check (validates completeness), grooming-prep -->

## Custom Fields

| Field | Custom Field ID | Notes |
|-------|-----------------|-------|
| Target start | `customfield_10015` | Used on epics only |
| Target end | `customfield_10016` | Used on epics only |
| Story Points | `customfield_10004` | Used on tasks and bugs |
| Blocked flag | `customfield_10517` | Boolean — set when work is blocked |

<!-- Used by: epic-health, roadmap-review, quarter-planning, dependency-mapper -->

## Story Points

- Scale: Fibonacci (1, 2, 3, 5, 8, 13)
- Required on tasks and bugs before moving to In Progress
- Epics are not pointed — their scope is measured by sub-issue points
- Estimation: team discusses during grooming, PO has final say

<!-- Used by: grooming-prep, quarter-planning -->

## Blocking and Dependencies

- Use the `Blocked` custom field flag (`customfield_10517`) when an issue can't proceed
- Also use issue links: `Blocks` / `Is blocked by` for explicit dependency chains
- Cross-epic dependencies are tracked via issue links, not a separate field
- Board has a "Blocked" swimlane that filters on the blocked flag

<!-- Used by: dependency-mapper, impact-assessment, epic-health -->

## Epic Conventions

- **Description template**: Goal, Background, Acceptance Criteria, Out of Scope
- **Assignment**: Assigned to the epic owner (usually a tech lead), not the PO
- **Closure**: PO decides when to close — either all sub-issues done or scope explicitly cut
- **Target dates**: Always set target start and target end on epics
- **Naming**: Start with a verb — "Implement...", "Migrate...", "Add..."

<!-- Used by: epic-health, feature-spec-writer, roadmap-brief, quarter-planning, release-notes-drafter -->

## API Gotchas

- `components` passed via `additional_fields` in `createJiraIssue` are silently dropped — always follow up with `editJiraIssue` to set components
- `parent` (for linking to epics) is also silently dropped on create — set it with a follow-up edit
- When transitioning to Closed, the `resolution` field must be set (e.g., `{"name": "Done"}`)

<!-- Used by: backlog-curator, intake-triager, requirements-analyst — any agent that writes to Jira -->

## JQL Query Examples

```
# All open issues in the project
project = MYPROJECT AND status NOT IN (Closed)

# Active epics
project = MYPROJECT AND issuetype = Epic AND status NOT IN (Closed)

# Blocked issues
project = MYPROJECT AND cf[10517] = "Yes" AND status NOT IN (Closed)

# Issues in an epic
parent = MYPROJECT-123

# Recently updated (last 7 days)
project = MYPROJECT AND updated >= -7d ORDER BY updated DESC
```

<!-- CRITICAL: agents like delivery-tracker rely on these patterns to query Jira.
     Without JQL examples, agents may fabricate queries or data. -->

## Additional Notes

- We do grooming every Tuesday at 10am
- Sprint length: 2 weeks (if using Scrum) / continuous flow (if Kanban)
- PO is the final decision-maker on priority and scope
