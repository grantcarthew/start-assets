# Create Task

Create a new task in the start-assets repository. This is an interactive process.

---

## Prerequisites

Confirm these values with the user before starting:

- **Task Name**: kebab-case identifier (e.g., `code-review`, `github-homebrew-release`)
- **Category Path**: Directory path under tasks/ (e.g., `golang`, `start`, `terraform`)
- **Description**: Brief description of what the task does
- **Role Reference**: Which role to use (e.g., `golang/assistant`, `cue/assistant`, or none)
- **Source Content**: Either:
  - An existing document to adapt
  - A description of what the task should do (to create from scratch)

Requirements:

- Write access to the start-assets repository
- CUE CLI installed (`cue version`)
- Understanding of the task's purpose and workflow

---

## Task Creation Process

**Steps**:

1. Gather prerequisites from user
2. Create directory structure
3. Create task.cue with schema definition
4. Create task.md with instructions
5. Create cue.mod/module.cue with dependencies
6. Validate with CUE tools
7. Publish to CUE registry

---

## Step 1: Gather Prerequisites

Ask the user for:

1. **Task name** - Must be kebab-case (e.g., `create-task`, `code-review`)
2. **Category** - Where it lives under tasks/ (e.g., `golang`, `start`, `terraform`)
3. **Description** - One-line summary for the task
4. **Role** - Which role to reference, format: `category/type` (e.g., `golang/assistant`)
5. **Source** - Either a file path to adapt or instructions for what the task should do

Example values:
```
Task name: github-homebrew-release
Category: golang
Description: Release Go project to GitHub with Homebrew tap distribution
Role: golang/assistant
Source: /path/to/existing-document.md (or describe the workflow)
```

---

## Step 2: Create Directory Structure

Create the task directory with cue.mod:

```bash
# Set variables from Step 1
CATEGORY="<category>"
TASK_NAME="<task-name>"

# Create directory structure
mkdir -p tasks/${CATEGORY}/${TASK_NAME}/cue.mod
```

Expected structure:
```
tasks/
└── <category>/
    └── <task-name>/
        ├── cue.mod/
        │   └── module.cue
        ├── task.cue
        └── task.md
```

---

## Step 3: Create task.cue

Create the task schema definition file.

**If using a role:**

```cue
package <packagename>

import (
	"github.com/grantcarthew/start-assets/schemas@v0"
	assistantRole "github.com/grantcarthew/start-assets/roles/<category>/<type>@v0:<type>"
)

task: schemas.#Task & {
	description: "<task description>"
	tags: ["<tag1>", "<tag2>", "<tag3>"]
	role: assistantRole.role
	file: "@module/task.md"
	prompt: """
		{{.file_contents}}

		## Custom Instructions

		{{.instructions}}
		"""
}
```

**If no role:**

```cue
package <packagename>

import "github.com/grantcarthew/start-assets/schemas@v0"

task: schemas.#Task & {
	description: "<task description>"
	tags: ["<tag1>", "<tag2>", "<tag3>"]
	file: "@module/task.md"
	prompt: """
		{{.file_contents}}

		## Custom Instructions

		{{.instructions}}
		"""
}
```

Notes:
- Package name: Convert task name to valid Go identifier (remove hyphens, use camelCase or single word)
- Tags: Use kebab-case, include relevant categories and keywords
- The `@module/` prefix resolves to the task's directory at runtime

---

## Step 4: Create task.md

Create the task instructions file. This is the main content that guides the AI agent.

**Structure guidelines:**

```markdown
# Task Title

Brief description of what this task accomplishes.

---

## Prerequisites

What the user needs to provide or have available before starting.

---

## Process

**Steps**:

1. Step one
2. Step two
3. ...

---

## Step 1: First Step

Detailed instructions for step 1.

```bash
# Commands if applicable
```

---

## Step 2: Second Step

Detailed instructions for step 2.

...

---

## Troubleshooting

Common issues and solutions (if applicable).
```

**Content guidelines:**

- Write for an AI agent to execute
- Be explicit about what commands to run
- Include expected results for validation
- Use markdown code blocks for commands
- Include decision points where user input is needed
- Keep steps atomic and verifiable

---

## Step 5: Create cue.mod/module.cue

Create the module definition with dependencies.

**If using a role:**

```cue
module: "github.com/grantcarthew/start-assets/tasks/<category>/<task-name>@v0"
language: {
	version: "v0.15.1"
}
source: {
	kind: "git"
}
deps: {
	"github.com/grantcarthew/start-assets/roles/<role-category>/<role-type>@v0": {
		v: "v0.1.0"
	}
	"github.com/grantcarthew/start-assets/schemas@v0": {
		v: "v0.1.0"
	}
}
```

**If no role:**

```cue
module: "github.com/grantcarthew/start-assets/tasks/<category>/<task-name>@v0"
language: {
	version: "v0.15.1"
}
source: {
	kind: "git"
}
deps: {
	"github.com/grantcarthew/start-assets/schemas@v0": {
		v: "v0.1.0"
	}
}
```

---

## Step 6: Validate with CUE Tools

Run validation from the task directory:

```bash
cd tasks/<category>/<task-name>

# Fetch dependencies
cue mod tidy

# Validate schema
cue vet task.cue

# Export to verify output (optional)
cue export task.cue
```

**Expected results:**

- `cue mod tidy` completes without errors
- `cue vet task.cue` produces no output (valid)
- `cue export task.cue` shows valid JSON with task definition

**If validation fails:**

- Check import paths match module.cue dependencies
- Verify package name is valid Go identifier
- Ensure all required fields are present
- Check for syntax errors in CUE files

---

## Step 7: Publish to CUE Registry

After validation passes, publish the new task:

```bash
# Navigate to task directory
cd tasks/<category>/<task-name>

# Determine version (check existing tags)
git tag -l "tasks/<category>/<task-name>/*"

# For new tasks, start with v0.1.0
VERSION="v0.1.0"

# Create and push git tag
git add .
git commit -m "feat(tasks): add <category>/<task-name> task"
git tag "tasks/<category>/<task-name>/${VERSION}"
git push origin main
git push origin "tasks/<category>/<task-name>/${VERSION}"

# Publish to CUE registry
cue mod publish ${VERSION}
```

**Verify publication:**

```bash
# The module should now be available at:
# github.com/grantcarthew/start-assets/tasks/<category>/<task-name>@v0
```

---

## Quick Reference

```bash
# Variables
CATEGORY="<category>"
TASK_NAME="<task-name>"
PACKAGE_NAME="<packagename>"
VERSION="v0.1.0"

# 1. Create structure
mkdir -p tasks/${CATEGORY}/${TASK_NAME}/cue.mod

# 2. Create files (task.cue, task.md, cue.mod/module.cue)
# ... edit files ...

# 3. Validate
cd tasks/${CATEGORY}/${TASK_NAME}
cue mod tidy
cue vet task.cue

# 4. Publish
git add .
git commit -m "feat(tasks): add ${CATEGORY}/${TASK_NAME} task"
git tag "tasks/${CATEGORY}/${TASK_NAME}/${VERSION}"
git push origin main
git push origin "tasks/${CATEGORY}/${TASK_NAME}/${VERSION}"
cue mod publish ${VERSION}
```

---

## Template Files

### task.cue (with role)

```cue
package PACKAGENAME

import (
	"github.com/grantcarthew/start-assets/schemas@v0"
	assistantRole "github.com/grantcarthew/start-assets/roles/ROLECATEGORY/ROLETYPE@v0:ROLETYPE"
)

task: schemas.#Task & {
	description: "DESCRIPTION"
	tags: ["TAG1", "TAG2"]
	role: assistantRole.role
	file: "@module/task.md"
	prompt: """
		{{.file_contents}}

		## Custom Instructions

		{{.instructions}}
		"""
}
```

### cue.mod/module.cue (with role)

```cue
module: "github.com/grantcarthew/start-assets/tasks/CATEGORY/TASKNAME@v0"
language: {
	version: "v0.15.1"
}
source: {
	kind: "git"
}
deps: {
	"github.com/grantcarthew/start-assets/roles/ROLECATEGORY/ROLETYPE@v0": {
		v: "v0.1.0"
	}
	"github.com/grantcarthew/start-assets/schemas@v0": {
		v: "v0.1.0"
	}
}
```
