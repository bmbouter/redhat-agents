---
name: suggest-improvement
description: When an agent discovers a problem, gap, or improvement opportunity in its own skills or workflows, open a GitHub issue (and optionally a PR) against the redhat-agents repo
---

## When to Use

Any agent should invoke this skill when it encounters:
- A skill that is missing information or gives bad guidance
- A workflow that could be improved based on real-world usage
- A gap — something the agent needed to do but had no skill for
- An error in an agent definition (wrong tool reference, missing prerequisite, etc.)
- A new pattern the user taught it that should be captured for everyone

## Instructions

### 1. Classify the finding

Determine what type of improvement this is:

| Type | Label | Example |
|------|-------|---------|
| Bug in a skill | `bug` | Skill says to use a JQL field that doesn't exist |
| Missing skill | `enhancement` | Agent needed to do X but no skill exists |
| Skill improvement | `enhancement` | Skill works but misses an important step |
| Agent definition issue | `bug` | Agent lists a tool that isn't available |
| New pattern | `enhancement` | User's workflow revealed a reusable technique |
| Documentation gap | `documentation` | README is unclear or outdated |

### 2. Open a GitHub issue

Create a GitHub issue on `bmbouter/redhat-agents`:

**Repository**: `bmbouter/redhat-agents`

**Issue title**: `[<asset-type>] <concise description>`
- Example: `[skills] backlog-health-check: stale threshold should be configurable`
- Example: `[skills] process-interview: missing question about custom issue types`
- Example: `[agents] New agent needed: capacity planner`

**Issue body**:
```
## What happened

[What the agent was doing when it found this]

## What's wrong / what's missing

[Specific problem or gap]

## Suggested fix

[How to improve it — be specific about what to change in which file]

## Files affected

- `<path to file>`

---
*Filed automatically by the [agent name] agent during a session.*
```

**Labels**: Apply the type label from Step 1.

### 3. Optionally create a PR

If the fix is straightforward and well-defined (e.g., adding a missing question, fixing a JQL query, updating a template), offer to:

1. Create a branch: `improve/<short-description>`
2. Make the change
3. Open a PR against `main` referencing the issue

Only do this for clear, low-risk fixes. For larger changes (new agents, restructuring), file the issue only.

### 4. Tell the user

After filing, tell the user:
> I noticed an improvement opportunity and filed issue #N on `bmbouter/redhat-agents`: "[title]". [One sentence about what it is.]

Do not file issues without telling the user. The user can veto filing if they disagree.
