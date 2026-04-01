# Shared Skills

Skills used across multiple roles. All Jira-connected agents depend on these.

| Skill | Purpose |
|-------|---------|
| `jira-setup` | One-time Atlassian API token + MCP configuration |
| `process-interview` | Interview-driven Jira workflow config generation |
| `suggest-improvement` | File issues/MRs against this repo when agents find gaps |

`jira-setup` and `process-interview` produce `local/jira-workflow.md` (gitignored) which all role-specific agents read at startup.

`suggest-improvement` is embedded in every agent and creates a self-improvement feedback loop — real-world usage files issues back to the `bmbouter/redhat-agents` repo.
