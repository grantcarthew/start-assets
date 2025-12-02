# start Schemas

CUE schemas for the start AI agent launcher.

## Module Information

- **Module:** `github.com/grantcarthew/start-schemas@v0`
- **Language:** CUE v0.11.0+
- **Source:** git

## Design Philosophy

These schemas define **pure constraints** without defaults. This allows:

1. **User control** - Users set their own defaults in their config
2. **No conflicts** - Multiple defaults would conflict and cancel out
3. **Simplicity** - Schemas define "what is valid", not "what is typical"

## Schemas

### #Index

Defines the structure for the asset discovery index.

**Purpose:**
- Enable CLI search and discovery without OCI catalog API
- Map friendly "category/item" paths to full module URLs
- Support search by name, description, and tags

**Index Keys:**
- Use `category/item` format (e.g., `"golang/code-review"`)
- Match user input exactly for direct lookup
- Match directory structure in repository

**Module Paths:**
- Include full category in module name
- Format: `github.com/grantcarthew/start-{type}-{category}-{item}@v{major}`
- Example: `github.com/grantcarthew/start-task-golang-code-review@v0`

**Resolution Logic:**

1. **Direct lookup**: `start task golang/code-review` → index lookup → install module
2. **Module URL**: `start task github.com/someone/task@v0` → skip index → direct install
3. **Search**: `start task review` → search index → show matches or auto-use single result

### #Task

Defines the schema for task workflows.

**Task Identification:**
- Tasks are identified by their **map key** (e.g., `tasks["code-review"]`)
- There is no `name` field - the key IS the name
- This avoids duplication and simplifies the schema

**Fields:**

- `description` (string, optional) - Human-readable description
- `tags` ([]string, optional) - Tags for categorization/search
- `role` (string, optional) - Reference to role name (validated at runtime)
- `agent` (string, optional) - Reference to agent name (validated at runtime)
- `file` (string, optional) - Path to file (provides `{{.file}}`, `{{.file_contents}}`)
- `command` (string, optional) - Shell command (provides `{{.command}}`, `{{.command_output}}`)
- `prompt` (string, optional) - Go template with placeholders
- `shell` (string, optional) - Override global shell (must not be empty)
- `timeout` (int, optional) - Command timeout in seconds (range: 1-3600, **no default**)

**Constraints:**

- At least one of `file`, `command`, or `prompt` must be present (validated by Go at runtime)
- `shell` must not be empty string if provided
- `timeout` must be between 1 and 3600 seconds (if provided)

## Usage

### Validate Schemas

```bash
cd schemas
cue vet task.cue task_example.cue
```

### Export Examples

```bash
cue export task.cue task_example.cue
```

### In Asset Modules

```cue
// tasks/golang/code-review/task.cue
package task

import "github.com/grantcarthew/start-schemas@v0"

// Concrete task ready to use
task: schemas.#Task & {
    description: "Review Go code changes"
    role: "code-reviewer"
    command: "git diff --staged -- '*.go'"
    prompt: """
        Review these Go code changes:

        {{.command_output}}

        Focus: {{.instructions}}
        """
    tags: ["golang", "review", "git"]
    timeout: 30  // Specific timeout for this task
}
```

### In User Config

```cue
// ~/.config/start/config.cue
package config

import "github.com/grantcarthew/start-schemas@v0"

// Apply global defaults to all tasks via pattern constraint
tasks: [_]: schemas.#Task & {
    timeout: *120 | _         // Global default: 2 minutes
    shell:   *"/bin/bash" | _ // Global default shell
}

// Define tasks (key is the task name)
tasks: {
    "code-review": {
        description: "Review code changes"
        command: "git diff --staged"
        prompt: "Review: {{.command_output}}"
        tags: ["review"]
        // Uses timeout: 120 from global default
    }

    "quick-check": {
        command: "go vet ./..."
        prompt: "Check: {{.command_output}}"
        timeout: 10  // Override global default
    }
}
```

## Publishing

```bash
# Tag and publish schemas
cd schemas
git tag schemas/v0.1.0
cue mod publish v0.1.0
git push origin schemas/v0.1.0
```

## Template Placeholders

Tasks support Go template syntax with these placeholders:

- `{{.instructions}}` - User's CLI arguments
- `{{.file}}` - Resolved file path
- `{{.file_contents}}` - Content of file
- `{{.command}}` - Command string
- `{{.command_output}}` - Output from executing command
- `{{.date}}` - Current ISO 8601 timestamp
