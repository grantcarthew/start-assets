# AGENTS.md

Asset definitions for the `start` AI agent launcher CLI. All assets are defined using CUE and published to the CUE registry.

## Repository Structure

| Directory | Purpose |
|-----------|---------|
| agents/ | AI CLI tool command templates |
| contexts/ | Environmental context definitions |
| roles/ | System prompt and behaviour definitions |
| schemas/ | CUE schema definitions |
| tasks/ | Task instruction definitions |
| index/ | Asset discovery index |

## Validation

Validate schemas and examples from the schemas directory:

```bash
cd schemas
cue vet utd.cue task.cue task_example.cue
cue vet utd.cue role.cue role_example.cue
cue vet utd.cue context.cue context_example.cue
cue vet agent.cue agent_example.cue
cue vet index.cue index_example.cue
```

Export examples to verify output:

```bash
cue export task.cue task_example.cue utd.cue
cue export agent.cue agent_example.cue
```

## Publishing

Tag and publish modules to the CUE registry:

```bash
cd schemas
git tag schemas/v0.1.0
cue mod publish v0.1.0
git push origin schemas/v0.1.0
```

## Code Style

- Use [CUE](https://cuelang.org/) for all asset definitions
- Schemas define pure constraints without defaults
- Assets are identified by map keys, not name fields
- Use kebab-case for tags and identifiers
- Follow the Unified Template Design (UTD) pattern for content generation

## Schema Patterns

### UTD (Unified Template Design)

Content is generated using the UTD pattern with these fields:

- `file` - Path to file (provides `{{.file}}`, `{{.file_contents}}`)
- `command` - Shell command (provides `{{.command}}`, `{{.command_output}}`)
- `prompt` - Go template with placeholders

Resolution priority: `prompt` > `file` > `command`

### Template Placeholders

- `{{.instructions}}` - User's CLI arguments
- `{{.file_contents}}` - Content of resolved file
- `{{.command_output}}` - Output from executing command
- `{{.date}}` - Current ISO 8601 timestamp

## Testing Changes

After modifying schemas or assets:

1. Run validation from the schemas directory
2. Export examples to verify JSON output is correct
3. Test with the start CLI if available
