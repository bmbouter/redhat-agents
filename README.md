# Red Hat Agents

A shared repository of AI agent assets — skills, agent definitions, prompts, and references — organized by role. Teams contribute reusable agent components that can be installed into any AI-assisted development workflow.

## Repository Structure

```
Product Owners/
├── agents/          # Agent definitions (persona, tools, behavior)
├── skills/          # Reusable skills invoked by agents or users
├── prompts/         # Prompt templates and system instructions
└── references/      # Reference docs, style guides, domain context
```

Each role directory follows this same structure. Additional roles can be added by creating a new top-level directory.

## Contributing

1. Pick or create the appropriate role directory (e.g., `Product Owners/`).
2. Add your asset to the correct subdirectory (`agents/`, `skills/`, `prompts/`, or `references/`).
3. Include a short description at the top of each file explaining what it does and when to use it.
4. Submit a merge request for review.

See individual subdirectory `README.md` files for format details and examples.

## License

This project is licensed under the Apache License 2.0 — see [LICENSE](LICENSE) for details.
