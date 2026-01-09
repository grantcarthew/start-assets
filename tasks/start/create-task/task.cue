package createtask

import "github.com/grantcarthew/start-assets/schemas@v0"

// Note: Using string reference for role until cue/assistant is published.
// After publishing, change to:
//   import assistantRole "github.com/grantcarthew/start-assets/roles/cue/assistant@v0:assistant"
//   role: assistantRole.role

task: schemas.#Task & {
	description: "Create a new task in the start-assets repository"
	tags: ["start-assets", "task", "create", "cue", "interactive"]
	role: "cue/assistant"
	file: "@module/task.md"
	prompt: """
		{{.file_contents}}

		## Custom Instructions

		{{.instructions}}
		"""
}
