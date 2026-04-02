# Red Hat Agents

**AI specialists for Product Owners and Product Managers.** Eight purpose-built agents that work with your Jira to handle the repetitive work — backlog hygiene, triage, delivery tracking, roadmap analysis, market problem definition, and stakeholder communication — so you can focus on decisions.

Every agent learns your team's specific Jira setup (project key, statuses, fields, conventions) through a one-time interview. No hardcoded assumptions.

## Quick Start

### Install with [Lola](https://github.com/RedHatProductSecurity/lola)

**Option 1 — Direct install:**
```bash
lola mod add https://gitlab.cee.redhat.com/bmbouter/redhat-agents.git
lola install redhat-agents -a claude-code
```

**Option 2 — Register the marketplace first:**
```bash
lola market add rh-agents https://gitlab.cee.redhat.com/bmbouter/redhat-agents/-/raw/main/marketplace.yml
lola install redhat-agents -a claude-code
```

**Option 3 — Declarative (add to your project's `.lola-req`):**
```
https://gitlab.cee.redhat.com/bmbouter/redhat-agents.git@main
```
Then run `lola sync`.

### First-Time Setup

After installation, run two setup commands:

```
/redhat-agents.jira-setup           # Configure Atlassian API token + MCP tools
/redhat-agents.process-interview    # Teach agents your Jira workflow
```

The process interview generates `local/jira-workflow.md` — a local, gitignored config that all agents read.

---

## The Roster

### Product Owners

Tactical, Jira-focused agents for day-to-day backlog operations.

**@redhat-agents.process-discoverer** — Workflow Discovery
> Interviews you about your Jira setup and generates the local workflow config. Run this first.
>
> Skills: `process-interview`

**@redhat-agents.backlog-curator** — Backlog Health
> Scans for stale tickets, missing fields, duplicates, and wrong statuses. Prepares grooming agendas. Suggests priority rebalancing when priorities drift.
>
> Skills: `backlog-health-check` · `grooming-prep` · `priority-rebalance`

**@redhat-agents.intake-triager** — Incoming Work
> Classifies new tickets (bug vs task vs epic), searches for duplicates, assesses severity and effort, drafts acceptance criteria. Recommends priority and parent epic.
>
> Skills: `intake-triage` · `impact-assessment` · `acceptance-criteria-writer`

**@redhat-agents.delivery-tracker** — Progress & Risks
> Tracks epic completion, flags at-risk work, maps dependency chains, generates stakeholder-ready status reports. Read-only — reports and recommends, never modifies tickets.
>
> Skills: `epic-health` · `status-report` · `dependency-mapper`

### Product Managers

Strategic, outward-facing agents for roadmap, market analysis, and stakeholder communication.

**@redhat-agents.roadmap-strategist** — Roadmap Planning
> Reviews roadmap health (overcommitment, stalled epics, timeline conflicts). Helps plan upcoming quarters. Generates roadmap briefs tailored to executives, engineering, or customers.
>
> Skills: `roadmap-review` · `quarter-planning` · `roadmap-brief`

**@redhat-agents.requirements-analyst** — Specs & Signals
> Turns unstructured input (conversations, feature requests, support escalations) into structured feature specs. Aggregates customer signals from Jira to surface demand patterns.
>
> Skills: `feature-spec-writer` · `customer-signal-aggregator`

**@redhat-agents.market-analyst** — Market Intelligence
> Structures market problems (segments, pain points, alternatives, opportunity sizing). Maps competitive landscapes. Scores feature opportunities against demand, competition, strategic fit, and feasibility.
>
> Skills: `market-problem-definition` · `competitive-landscape` · `opportunity-assessment`

**@redhat-agents.stakeholder-communicator** — Outward Communication
> Documents product decisions with full context and alternatives. Drafts customer-facing release notes from Jira data. Prepares executive briefs adapted to the audience.
>
> Skills: `decision-record` · `release-notes-drafter` · `stakeholder-brief`

---

## All Skills

| Skill | What it does |
|-------|-------------|
| **jira-setup** | One-time Atlassian API token + MCP configuration |
| **process-interview** | Generates `local/jira-workflow.md` from an interactive interview |
| **suggest-improvement** | Files issues/MRs against this repo when agents find gaps |
| **backlog-health-check** | Scans for stale, incomplete, orphaned, or duplicate tickets |
| **grooming-prep** | Prepares grooming session agendas with readiness assessments |
| **priority-rebalance** | Reviews priority distribution and suggests adjustments |
| **intake-triage** | Classifies tickets, finds duplicates, recommends fields |
| **impact-assessment** | Evaluates severity, urgency, and effort with Jira context |
| **acceptance-criteria-writer** | Drafts testable acceptance criteria from descriptions |
| **epic-health** | Reports epic completion, velocity, at-risk issues, target dates |
| **status-report** | Generates stakeholder status reports from Jira data |
| **dependency-mapper** | Traces blocking chains and ranks high-impact blockers |
| **roadmap-review** | Analyzes roadmap for overcommitment, gaps, and stalled epics |
| **quarter-planning** | Plans upcoming quarters with scope estimates and dependencies |
| **roadmap-brief** | Translates epic data into audience-tailored roadmap narratives |
| **feature-spec-writer** | Converts unstructured input into structured feature specs |
| **customer-signal-aggregator** | Mines Jira for demand patterns grouped by theme |
| **market-problem-definition** | Structures market problems with segments, pain points, sizing |
| **competitive-landscape** | Maps competitors by capability area with gap analysis |
| **opportunity-assessment** | Scores feature opportunities across 5 dimensions |
| **decision-record** | Documents decisions with context, alternatives, and rationale |
| **release-notes-drafter** | Generates customer-facing release notes from closed Jira work |
| **stakeholder-brief** | Prepares executive summaries adapted to the audience |

---

## Self-Improvement

Every agent includes the `suggest-improvement` skill. When an agent discovers a gap, error, or missing capability in its own workflows, it files a GitLab issue (and optionally an MR) against this repository. The user is always informed and can veto before filing.

This creates a feedback loop: real-world usage continuously improves the agents.

---

## Repository Structure

```
module/                         # Lola-compatible AI context module
├── AGENTS.md                   # Module overview for AI assistants
├── mcps.json                   # MCP server configuration
├── skills/                     # 23 skills (each in <name>/SKILL.md)
├── agents/                     # 8 agent definitions
└── commands/                   # Slash commands (jira-setup, process-interview)
marketplace.yml                 # Self-hosted Lola marketplace definition
.lola-req                       # Declarative installation example
local/                          # Your Jira workflow config (gitignored)
```

## Distribution

This module is distributed through [Lola](https://github.com/RedHatProductSecurity/lola) and supports all three installation methods — direct git URL, self-hosted marketplace, and declarative `.lola-req`. No contributions to or approval from the Lola project are required.

Compatible with: **Claude Code** · **Cursor** · **Gemini CLI** · **OpenCode**

## License

Apache License 2.0 — see [LICENSE](LICENSE) for details.
