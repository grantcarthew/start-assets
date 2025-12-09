# Claude Code

- GitHub Repo: https://github.com/anthropics/claude-code
- Documentation: https://docs.anthropic.com/en/docs/claude-code/overview

## CLI Flags Reference

> Last updated: 2025-12-09
> Source: `claude --help` (version installed locally)
> Commit: `de49a07` (2025-12-07)

### Main CLI Flags

| Flag | Alias | Type | Description |
|------|-------|------|-------------|
| `--debug` | `-d` | string (opt) | Enable debug mode with optional category filtering (e.g., "api,hooks" or "!statsig") |
| `--verbose` | - | boolean | Override verbose mode setting from config |
| `--print` | `-p` | boolean | Print response and exit (non-interactive, for pipes) |
| `--output-format` | - | string | Output format with --print: `text`, `json`, `stream-json` |
| `--json-schema` | - | string | JSON Schema for structured output validation |
| `--include-partial-messages` | - | boolean | Include partial chunks (with --print --output-format=stream-json) |
| `--input-format` | - | string | Input format with --print: `text`, `stream-json` |
| `--dangerously-skip-permissions` | - | boolean | Bypass all permission checks (sandboxes only) |
| `--allow-dangerously-skip-permissions` | - | boolean | Enable bypass option without enabling by default |
| `--replay-user-messages` | - | boolean | Re-emit user messages from stdin (stream-json mode) |
| `--allowedTools` | `--allowed-tools` | string[] | Tools to allow (e.g., "Bash(git:*) Edit") |
| `--tools` | - | string[] | Available tools: "", "default", or tool names |
| `--disallowedTools` | `--disallowed-tools` | string[] | Tools to deny |
| `--mcp-config` | - | string[] | Load MCP servers from JSON files or strings |
| `--system-prompt` | - | string | System prompt for the session |
| `--append-system-prompt` | - | string | Append to default system prompt |
| `--append-system-prompt-file` | - | string | Append system prompt from file path |
| `--permission-mode` | - | string | Permission mode: `acceptEdits`, `bypassPermissions`, `default`, `dontAsk`, `plan` |
| `--continue` | `-c` | boolean | Continue most recent conversation |
| `--resume` | `-r` | string (opt) | Resume conversation by session ID or interactive select |
| `--fork-session` | - | boolean | Create new session ID when resuming |
| `--model` | - | string | Model alias (sonnet, opus) or full name |
| `--fallback-model` | - | string | Fallback model when default is overloaded (with --print) |
| `--settings` | - | string | Path to settings JSON file or JSON string |
| `--add-dir` | - | string[] | Additional directories for tool access |
| `--ide` | - | boolean | Auto-connect to IDE on startup |
| `--strict-mcp-config` | - | boolean | Only use MCP servers from --mcp-config |
| `--session-id` | - | string | Specific session UUID |
| `--agents` | - | string | JSON object defining custom agents |
| `--setting-sources` | - | string | Setting sources to load: user, project, local |
| `--plugin-dir` | - | string[] | Load plugins from directories |
| `--version` | `-v` | boolean | Show version |
| `--help` | `-h` | boolean | Show help |
| `--mcp-debug` | - | boolean | [DEPRECATED] Use --debug instead |

### Subcommands

#### `claude mcp` - MCP Server Management

| Subcommand | Description |
|------------|-------------|
| `serve` | Start the Claude Code MCP server |
| `add` | Add an MCP server |
| `remove` | Remove an MCP server |
| `list` | List configured MCP servers |
| `get` | Get details about an MCP server |
| `add-json` | Add MCP server with JSON string |
| `add-from-claude-desktop` | Import from Claude Desktop (Mac/WSL) |
| `reset-project-choices` | Reset project-scoped server approvals |

##### `claude mcp add` Flags

| Flag | Alias | Type | Description |
|------|-------|------|-------------|
| `--scope` | `-s` | string | Scope: `local`, `user`, `project` (default: local) |
| `--transport` | `-t` | string | Transport: `stdio`, `sse`, `http` (default: stdio) |
| `--env` | `-e` | string[] | Environment variables (`KEY=value`) |
| `--header` | `-H` | string[] | WebSocket headers |

##### `claude mcp serve` Flags

| Flag | Alias | Type | Description |
|------|-------|------|-------------|
| `--debug` | `-d` | boolean | Enable debug mode |
| `--verbose` | - | boolean | Override verbose mode |

#### `claude plugin` - Plugin Management

| Subcommand | Description |
|------------|-------------|
| `validate` | Validate a plugin or manifest |
| `marketplace` | Manage marketplaces |
| `install` / `i` | Install a plugin |
| `uninstall` / `remove` | Uninstall a plugin |
| `enable` | Enable a disabled plugin |
| `disable` | Disable an enabled plugin |

##### `claude plugin marketplace` Subcommands

| Subcommand | Description |
|------------|-------------|
| `add` | Add marketplace from URL/path/GitHub |
| `list` | List configured marketplaces |
| `remove` / `rm` | Remove a marketplace |
| `update` | Update marketplace(s) from source |

#### `claude install` - Installation Management

| Flag | Type | Description |
|------|------|-------------|
| `--force` | boolean | Force installation even if installed |
| `[target]` | string | Version: `stable`, `latest`, or specific |

#### Other Commands

| Command | Description |
|---------|-------------|
| `migrate-installer` | Migrate from global npm to local install |
| `setup-token` | Set up long-lived auth token |
| `doctor` | Check auto-updater health |
| `update` | Check for and install updates |

### Environment Variables

#### Authentication

| Variable | Purpose |
|----------|---------|
| `ANTHROPIC_API_KEY` | API key for direct Anthropic API |
| `CLAUDE_CODE_USE_VERTEX` | Use Vertex AI (set to `1`) |
| `GOOGLE_APPLICATION_CREDENTIALS` | GCP credentials path (with Vertex) |
| `GOOGLE_CLOUD_PROJECT` | GCP project ID (with Vertex) |
| `GOOGLE_CLOUD_LOCATION` | GCP region (with Vertex) |

#### Runtime

| Variable | Purpose |
|----------|---------|
| `CLAUDECODE` | Set to `1` when running in Claude Code |
| `CLAUDE_CODE_ENTRYPOINT` | Entry point type (`cli`, `ide`) |
| `CLAUDE_CONFIG_DIR` | Override config directory |

#### Behaviour

| Variable | Purpose |
|----------|---------|
| `NO_COLOR` | Disable color output |
| `FORCE_COLOR` | Force color output |

## Configuration

Config directory: `~/.claude/`

### Settings File

`~/.claude/settings.json`

```json
{
  "permissions": {
    "allow": ["Read(*)", "Bash(git:*)"],
    "deny": ["Bash(rm -rf:*)"],
    "ask": []
  },
  "model": "sonnet",
  "alwaysThinkingEnabled": true
}
```

### Directory Structure

| Path | Purpose |
|------|---------|
| `~/.claude/settings.json` | User settings |
| `~/.claude/commands/` | Custom slash commands |
| `~/.claude/plugins/` | Installed plugins |
| `~/.claude/projects/` | Project-specific settings |
| `~/.claude/history.jsonl` | Conversation history |
| `~/.claude/todos/` | Todo list state |
| `~/.claude/session-env/` | Session environment |

### Project Settings

`.claude/settings.json` in project root for project-specific settings.

### Permission Modes

| Mode | Description |
|------|-------------|
| `default` | Ask for permission on sensitive operations |
| `acceptEdits` | Auto-accept file edits, ask for commands |
| `dontAsk` | Don't ask, but don't execute denied |
| `bypassPermissions` | Skip all permission checks |
| `plan` | Planning mode |

### Models

| Alias | Description |
|-------|-------------|
| `haiku` | Claude 3.5 Haiku (fast) |
| `sonnet` | Claude Sonnet 4.5 (balanced) |
| `opus` | Claude Opus 4.5 (powerful) |

## Usage Examples

```bash
# Interactive mode
claude

# Non-interactive with prompt
claude -p "Explain this code"

# With system prompt file (workaround - see issue #6153)
claude --append-system-prompt "$(cat ROLE.md)" "Your prompt"

# With specific model
claude --model opus "Complex task"

# Resume last session
claude --continue

# With permission mode
claude --permission-mode acceptEdits "Refactor this"

# JSON output
claude -p --output-format json "Generate config"

# With allowed tools
claude --allowed-tools "Read,Edit,Bash(git:*)" "Review changes"
```

## Notes

### Feature Added (Issue #6153)

The `--append-system-prompt-file` flag was implemented:

```bash
claude --append-system-prompt-file ROLE.md "Your prompt"
```

This replaces the previous workaround:
```bash
claude --append-system-prompt "$(cat ROLE.md)" "prompt"
```
