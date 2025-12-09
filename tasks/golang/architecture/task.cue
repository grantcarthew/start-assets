package architecture

import (
	"github.com/grantcarthew/start-assets/schemas@v0"
	agentRole "github.com/grantcarthew/start-assets/roles/golang/agent@v0:agent"
)

task: schemas.#Task & {
	description: "Analyse codebase structure, dependencies, and design patterns"
	tags: ["golang", "architecture", "design", "structure", "dependencies"]
	role: agentRole.role
	file: "@module/task.md"
	prompt: """
		{{.file_contents}}

		## Custom Instructions

		{{.instructions}}
		"""
}
