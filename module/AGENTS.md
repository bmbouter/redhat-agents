# Red Hat Agents

AI agents and skills for Product Owners and Product Managers. All agents interact with Jira and read from a local workflow configuration generated during setup.

## Setup (run first)

- **First-time setup**: Use `/redhat-agents.jira-setup` to configure Atlassian API tokens and MCP tools
- **Workflow discovery**: Use `/redhat-agents.process-interview` to teach agents how your team uses Jira — generates `local/jira-workflow.md` which all agents read

## Product Owner Agents

- **@redhat-agents.process-discoverer**: Interviews you about your Jira workflow and generates local config
- **@redhat-agents.backlog-curator**: Keeps the backlog healthy, prioritized, and grooming-ready
- **@redhat-agents.intake-triager**: Classifies, assesses, and routes incoming Jira work items
- **@redhat-agents.delivery-tracker**: Monitors epic progress, surfaces risks, generates status reports

## Product Manager Agents

- **@redhat-agents.roadmap-strategist**: Plans, evaluates, and communicates the product roadmap
- **@redhat-agents.requirements-analyst**: Translates customer needs into structured specs and epics
- **@redhat-agents.market-analyst**: Defines market problems, maps competitors, assesses opportunities
- **@redhat-agents.stakeholder-communicator**: Produces decision records, release notes, and executive briefs

## Skills

All agents share the `suggest-improvement` skill — when they find gaps in their own workflows, they file issues against this repo.

## Local Configuration

The `local/` directory (gitignored) stores your personal Jira workflow configuration. Run `/redhat-agents.process-interview` to generate it.
