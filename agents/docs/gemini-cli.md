# Google Gemini

- Gemini CLI Repo: <https://github.com/google-gemini/gemini-cli>

## CLI Flags Reference

> Last updated: 2025-12-09
> Source: gemini-cli repo commit `91c46311c` (2025-12-08)
> File: `packages/cli/src/config/config.ts`

### Main CLI Flags (Visible)

| Flag                         | Alias | Type    | Description                                       |
| ---------------------------- | ----- | ------- | ------------------------------------------------- |
| `--debug`                    | `-d`  | boolean | Run in debug mode                                 |
| `--model`                    | `-m`  | string  | Model to use                                      |
| `--prompt`                   | `-p`  | string  | Prompt (deprecated, use positional)               |
| `--prompt-interactive`       | `-i`  | string  | Execute prompt and continue in interactive mode   |
| `--sandbox`                  | `-s`  | boolean | Run in sandbox                                    |
| `--yolo`                     | `-y`  | boolean | Auto-approve all actions                          |
| `--approval-mode`            | -     | string  | Set approval mode: `default`, `auto_edit`, `yolo` |
| `--experimental-acp`         | -     | boolean | Starts agent in ACP mode                          |
| `--allowed-mcp-server-names` | -     | array   | Allowed MCP server names                          |
| `--allowed-tools`            | -     | array   | Tools allowed to run without confirmation         |
| `--extensions`               | `-e`  | array   | List of extensions to use                         |
| `--list-extensions`          | `-l`  | boolean | List all available extensions and exit            |
| `--resume`                   | `-r`  | string  | Resume a previous session (`latest` or index)     |
| `--list-sessions`            | -     | boolean | List available sessions for current project       |
| `--delete-session`           | -     | string  | Delete a session by index number                  |
| `--include-directories`      | -     | array   | Additional directories to include in workspace    |
| `--screen-reader`            | -     | boolean | Enable screen reader mode for accessibility       |
| `--output-format`            | `-o`  | string  | Output format: `text`, `json`, `stream-json`      |
| `--version`                  | `-v`  | boolean | Show version                                      |
| `--help`                     | `-h`  | boolean | Show help                                         |

### Hidden Flags (Not shown in `--help`)

| Flag                 | Type   | Description                                        |
| -------------------- | ------ | -------------------------------------------------- |
| `--fake-responses`   | string | Path to file with fake model responses for testing |
| `--record-responses` | string | Path to file to record model responses for testing |

### Subcommand Flags

#### `gemini mcp add`

| Flag              | Alias          | Type    | Description                                     |
| ----------------- | -------------- | ------- | ----------------------------------------------- |
| `--scope`         | `-s`           | string  | Configuration scope: `user`, `project`          |
| `--transport`     | `-t`, `--type` | string  | Transport type: `stdio`, `sse`, `http`          |
| `--env`           | `-e`           | array   | Set environment variables (`KEY=value`)         |
| `--header`        | `-H`           | array   | Set HTTP headers for SSE/HTTP transports        |
| `--timeout`       | -              | number  | Connection timeout in milliseconds              |
| `--trust`         | -              | boolean | Trust server (bypass tool confirmation prompts) |
| `--description`   | -              | string  | Description for the server                      |
| `--include-tools` | -              | array   | Tools to include                                |
| `--exclude-tools` | -              | array   | Tools to exclude                                |

#### `gemini extensions install`

| Flag            | Type    | Description                       |
| --------------- | ------- | --------------------------------- |
| `--ref`         | string  | Git ref to install from           |
| `--auto-update` | boolean | Enable auto-update                |
| `--pre-release` | boolean | Enable pre-release versions       |
| `--consent`     | boolean | Skip security confirmation prompt |

#### `gemini hooks migrate`

| Flag            | Type    | Description                    |
| --------------- | ------- | ------------------------------ |
| `--from-claude` | boolean | Migrate from Claude Code hooks |

### Environment Variables

#### Authentication & API

| Variable                         | Purpose                          |
| -------------------------------- | -------------------------------- |
| `GEMINI_API_KEY`                 | API key authentication           |
| `GOOGLE_API_KEY`                 | Alternative API key              |
| `GOOGLE_APPLICATION_CREDENTIALS` | Service account credentials path |
| `GOOGLE_CLOUD_PROJECT`           | GCP project ID                   |
| `GOOGLE_CLOUD_PROJECT_ID`        | Alternative GCP project ID       |
| `GOOGLE_CLOUD_LOCATION`          | GCP region                       |
| `GOOGLE_CLOUD_ACCESS_TOKEN`      | Cloud access token               |
| `GOOGLE_GENAI_USE_GCA`           | Use Google Cloud auth            |

#### Configuration & Behaviour

| Variable                       | Purpose                             |
| ------------------------------ | ----------------------------------- |
| `GEMINI_MODEL`                 | Override default model              |
| `GEMINI_SYSTEM_MD`             | Path to system prompt Markdown file |
| `GEMINI_WRITE_SYSTEM_MD`       | Path to write system prompt         |
| `GEMINI_SANDBOX`               | Enable sandbox (`docker`, `true`)   |
| `GEMINI_SANDBOX_IMAGE`         | Custom sandbox Docker image         |
| `GEMINI_SANDBOX_PROXY_COMMAND` | Proxy command for sandbox           |
| `GEMINI_YOLO_MODE`             | Enable YOLO mode (`true`)           |
| `GEMINI_DEFAULT_AUTH_TYPE`     | Default authentication type         |

#### Debug & Development

| Variable                        | Purpose                                    |
| ------------------------------- | ------------------------------------------ |
| `DEBUG`                         | Enable debug mode (`true`, `1`)            |
| `DEBUG_MODE`                    | Alternative debug flag                     |
| `GEMINI_DEBUG_LOG_FILE`         | Debug log file path                        |
| `GEMINI_DEV_TRACING`            | Enable development tracing (`true`)        |
| `GEMINI_CLI_NO_RELAUNCH`        | Prevent app relaunching                    |
| `GEMINI_CLI_CUSTOM_HEADERS`     | Custom headers for API requests            |
| `GEMINI_API_KEY_AUTH_MECHANISM` | Auth mechanism (default: `x-goog-api-key`) |

#### Paths & Storage

| Variable                          | Purpose                        |
| --------------------------------- | ------------------------------ |
| `GEMINI_CONFIG_DIR`               | Override config directory      |
| `GEMINI_CLI_SYSTEM_SETTINGS_PATH` | Override system settings path  |
| `GEMINI_CLI_SYSTEM_DEFAULTS_PATH` | Override system defaults path  |
| `GEMINI_CLI_TRUSTED_FOLDERS_PATH` | Override trusted folders path  |
| `GEMINI_FORCE_FILE_STORAGE`       | Force file-based token storage |

#### IDE Integration

| Variable                              | Purpose                            |
| ------------------------------------- | ---------------------------------- |
| `GEMINI_CLI_IDE_WORKSPACE_PATH`       | IDE workspace path                 |
| `GEMINI_CLI_IDE_SERVER_PORT`          | IDE server port                    |
| `GEMINI_CLI_IDE_SERVER_STDIO_COMMAND` | IDE server stdio command           |
| `GEMINI_CLI_IDE_SERVER_STDIO_ARGS`    | IDE server stdio args (JSON array) |

#### Testing & CI

| Variable                      | Purpose                        |
| ----------------------------- | ------------------------------ |
| `GEMINI_CLI_INTEGRATION_TEST` | Integration test mode (`true`) |
| `GEMINI_CLI_TEST_VAR`         | Test variable passthrough      |
| `NO_BROWSER`                  | Suppress browser launch        |
| `NO_COLOR`                    | Disable colour output          |

#### OAuth

| Variable              | Purpose                                    |
| --------------------- | ------------------------------------------ |
| `OAUTH_CALLBACK_HOST` | OAuth callback host (default: `localhost`) |
| `OAUTH_CALLBACK_PORT` | OAuth callback port                        |

## Settings

~/.gemini/settings.json

```json
{
  "theme": "Default",
  "selectedAuthType": "vertex-ai",
  "preferredEditor": "vscode",
  "contextFileName": "AGENTS.md"
}
```

## Docker Image

docker run --rm -it us-docker.pkg.dev/gemini-code-dev/gemini-cli/sandbox:0.1.1
