# Agents

Agent definitions for AI CLI tools.

Each subdirectory contains a CUE package defining an agent with its command template, supported models, and metadata.

## Structure

```
agents/<name>/
├── agent.cue
└── cue.mod/module.cue
```

## Available Agents

- `claude` - Claude Code by Anthropic
- `gemini` - Gemini CLI by Google
- `aichat` - AIChat multi-provider CLI

## Documentation

See `docs/` for CLI reference documentation.
