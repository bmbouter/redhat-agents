---
name: jira-setup
description: Configure Atlassian Jira MCP tools — walks the user through API token creation and MCP settings configuration
---

## When to Use

Run this before using any Jira-connected agents. Required once per machine.

## Instructions

Walk the user through the following steps. Pause after each step and confirm before proceeding.

### Step 1: Check for existing Atlassian MCP configuration

Check whether the user's AI tool already has Atlassian MCP tools configured. Look for an existing `mcp__plugin_atlassian_atlassian__` tool prefix or similar Atlassian/Jira integration.

If already configured, skip to Step 4 (verification).

### Step 2: Create an Atlassian API token

Tell the user:

> To connect to Jira, you need an Atlassian API token. Follow these steps:
>
> 1. Go to https://id.atlassian.com/manage-profile/security/api-tokens
> 2. Click **Create API token**
> 3. Give it a name like "AI Agent Access"
> 4. Copy the token — you will not be able to see it again
>
> Paste the token here when ready.

Wait for the user to provide the token. Do NOT store the token in any file — it should only go into the MCP configuration.

### Step 3: Configure MCP settings

The Atlassian MCP plugin needs the following configuration. Guide the user to add this to their AI tool's MCP settings (e.g., Claude Code's `settings.json`, `.claude.json`, or equivalent):

```json
{
  "mcpServers": {
    "atlassian": {
      "type": "plugin",
      "id": "atlassian",
      "config": {
        "atlassianEmail": "<user's email>",
        "atlassianApiToken": "<token from step 2>",
        "atlassianUrl": "https://<instance>.atlassian.net"
      }
    }
  }
}
```

Ask the user for:
- Their Atlassian email address
- Their Jira instance URL (e.g., `https://yourcompany.atlassian.net`)
- The API token from Step 2

Help them place the configuration in the correct file for their tool.

### Step 4: Verify connectivity

Test the connection by searching for a known project:

```
searchJiraIssuesUsingJql:
  jql: "project = <project_key> ORDER BY updated DESC"
  maxResults: 1
```

If this succeeds, tell the user Jira is connected and ready.

If it fails, troubleshoot:
- Check the API token is correct
- Check the email matches the Atlassian account
- Check the instance URL is correct
- Check network connectivity (VPN may be required)

### Step 5: Next steps

Tell the user:

> Jira is connected. Next, run `/process-interview` to teach the agents how your team uses Jira. This generates a local workflow config that all agents will reference.
