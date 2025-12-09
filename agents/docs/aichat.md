# AIChat

- GitHub Repo: https://github.com/sigoden/aichat

## CLI Flags Reference

> Last updated: 2025-12-09
> Source: aichat repo commit `4ddc28d` (2025-12-01)
> File: `src/cli.rs`

### All CLI Flags (All Visible)

| Flag                | Alias | Type           | Description                              |
| ------------------- | ----- | -------------- | ---------------------------------------- |
| `--model`           | `-m`  | string         | Select a LLM model                       |
| `--prompt`          | -     | string         | Use the system prompt                    |
| `--role`            | `-r`  | string         | Select a role                            |
| `--session`         | `-s`  | string (opt)   | Start or join a session                  |
| `--empty-session`   | -     | boolean        | Ensure the session is empty              |
| `--save-session`    | -     | boolean        | Ensure conversation is saved to session  |
| `--agent`           | `-a`  | string         | Start an agent                           |
| `--agent-variable`  | -     | NAME VALUE     | Set agent variables (two args)           |
| `--rag`             | -     | string         | Start a RAG                              |
| `--rebuild-rag`     | -     | boolean        | Rebuild the RAG to sync document changes |
| `--macro`           | -     | string         | Execute a macro                          |
| `--serve`           | -     | string (opt)   | Serve the LLM API and WebApp             |
| `--execute`         | `-e`  | boolean        | Execute commands in natural language     |
| `--code`            | `-c`  | boolean        | Output code only                         |
| `--file`            | `-f`  | string (multi) | Include files, directories, or URLs      |
| `--no-stream`       | `-S`  | boolean        | Turn off stream mode                     |
| `--dry-run`         | -     | boolean        | Display message without sending          |
| `--info`            | -     | boolean        | Display information                      |
| `--sync-models`     | -     | boolean        | Sync models updates                      |
| `--list-models`     | -     | boolean        | List all available chat models           |
| `--list-roles`      | -     | boolean        | List all roles                           |
| `--list-sessions`   | -     | boolean        | List all sessions                        |
| `--list-agents`     | -     | boolean        | List all agents                          |
| `--list-rags`       | -     | boolean        | List all RAGs                            |
| `--list-macros`     | -     | boolean        | List all macros                          |
| `--version`         | `-V`  | boolean        | Show version                             |
| `--help`            | `-h`  | boolean        | Show help                                |

### Environment Variables

All environment variables use the `AICHAT_` prefix.

#### Configuration

| Variable                  | Purpose                                    |
| ------------------------- | ------------------------------------------ |
| `AICHAT_CONFIG_DIR`       | Override config directory                  |
| `AICHAT_CONFIG_FILE`      | Override config file path                  |
| `AICHAT_ROLES_DIR`        | Override roles directory                   |
| `AICHAT_MACROS_DIR`       | Override macros directory                  |
| `AICHAT_SESSIONS_DIR`     | Override sessions directory                |
| `AICHAT_RAGS_DIR`         | Override RAGs directory                    |
| `AICHAT_FUNCTIONS_DIR`    | Override functions directory               |
| `AICHAT_MESSAGES_FILE`    | Override messages file path                |
| `AICHAT_ENV_FILE`         | Override .env file path                    |

#### Runtime

| Variable                         | Purpose                              |
| -------------------------------- | ------------------------------------ |
| `AICHAT_MODEL`                   | Override default model               |
| `AICHAT_KEYBINDINGS`             | Override keybindings (emacs/vi)      |
| `AICHAT_MAPPING_TOOLS`           | Override tool mappings               |
| `AICHAT_DOCUMENT_LOADERS`        | Override document loaders            |
| `AICHAT_PROVIDER` / `PLATFORM`   | Set default provider                 |
| `AICHAT_SHELL`                   | Override shell for command execution |
| `AICHAT_LIGHT_THEME`             | Enable light theme                   |
| `AICHAT_VARIABLES`               | Set agent variables                  |
| `AICHAT_EMBEDDINGS_RETRY_LIMIT`  | Retry limit for embeddings           |

#### Logging

| Variable            | Purpose               |
| ------------------- | --------------------- |
| `AICHAT_LOG_LEVEL`  | Set log level         |
| `AICHAT_LOG_PATH`   | Set log file path     |
| `AICHAT_LOG_FILTER` | Set log filter        |

#### Display

| Variable    | Purpose              |
| ----------- | -------------------- |
| `NO_COLOR`  | Disable color output |
| `COLORTERM` | Terminal color mode  |

#### Per-Client Environment Variables

Each client type can have its own environment variables using the pattern:
`{CLIENT_NAME}_DATA_DIR`, `{CLIENT_NAME}_CONFIG_FILE`, `{CLIENT_NAME}_FUNCTIONS_DIR`

For API keys, clients typically use their standard environment variables:
- `OPENAI_API_KEY`
- `ANTHROPIC_API_KEY`
- `GOOGLE_API_KEY`
- etc.

## Configuration

Config file: `~/.config/aichat/config.yaml`

### Key Configuration Options

```yaml
# ---- LLM ----
model: openai:gpt-4o             # Specify the LLM to use
temperature: null                # Temperature parameter (0, 1)
top_p: null                      # Top-p parameter

# ---- Behavior ----
stream: true                     # Use stream-style API
save: true                       # Persist messages
keybindings: emacs               # Keybinding style (emacs, vi)
editor: null                     # Editor command (vim, emacs, nano)
wrap: no                         # Text wrapping (no, auto, <max-width>)
wrap_code: false                 # Wrap code blocks

# ---- Function Calling ----
function_calling: true           # Enable function calling
mapping_tools:                   # Tool aliases
  fs: 'fs_cat,fs_ls,fs_mkdir,fs_rm,fs_write'
use_tools: null                  # Default tools

# ---- Prelude ----
repl_prelude: null               # Default role/session for REPL
cmd_prelude: null                # Default role/session for CMD
agent_prelude: null              # Session for agents

# ---- Session ----
save_session: null               # Auto-save sessions
compress_threshold: 4000         # Compression threshold

# ---- RAG ----
rag_embedding_model: null        # Embedding model
rag_reranker_model: null         # Reranker model
rag_top_k: 5                     # Documents to retrieve
rag_chunk_size: null             # Chunk size
rag_chunk_overlap: null          # Chunk overlap

# ---- Appearance ----
highlight: true                  # Syntax highlighting
light_theme: false               # Light color theme

# ---- Misc ----
serve_addr: 127.0.0.1:8000       # Server address
user_agent: null                 # HTTP User-Agent
save_shell_history: true         # Save shell history
```

### Supported Providers

OpenAI, Claude, Gemini, Ollama, Groq, Azure-OpenAI, VertexAI, Bedrock, GitHub Models, Mistral, Deepseek, AI21, XAI Grok, Cohere, Perplexity, Cloudflare, OpenRouter, Ernie, Qianwen, Moonshot, ZhipuAI, MiniMax, Deepinfra, VoyageAI, and any OpenAI-compatible API.

### Example Client Configurations

```yaml
clients:
  # VertexAI (Google Cloud)
  - type: vertexai
    project_id: your-project-id
    location: us-central1

  # OpenAI-compatible (e.g., Ollama)
  - type: openai-compatible
    name: ollama
    api_base: http://localhost:11434/v1
    models:
      - name: llama3.1
        max_input_tokens: 128000
        supports_function_calling: true

  # Claude (Anthropic)
  - type: claude
    api_key: xxx
```

## Roles

Roles are markdown files stored in `~/.config/aichat/roles/`.

### Role Format

```markdown
---
model: openai:gpt-4o
temperature: 0.7
use_tools: fs,web_search
---

You are a helpful assistant...
```

### Built-in Roles

- `%shell%` - Shell command generation
- `%explain-shell%` - Explain shell commands
- `%code%` - Code output only

## Usage Examples

```bash
# Basic query
aichat "What is Rust?"

# With role
aichat -r coder "Write a hello world in Go"

# With file input
aichat -f main.go "Explain this code"

# Execute shell commands
aichat -e "list all PDF files"

# Start session
aichat -s mysession "Let's discuss Go"

# Use specific model
aichat -m claude:claude-3-5-sonnet "Hello"

# Start local server
aichat --serve 0.0.0.0:8080
```
