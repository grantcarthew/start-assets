package refactor

import (
	"github.com/grantcarthew/start-assets/schemas@v0"
	agentRole "github.com/grantcarthew/start-assets/roles/golang/agent@v0:agent"
)

task: schemas.#Task & {
	description: "Refactor Go code to improve structure, readability, and maintainability"
	tags: ["golang", "refactor", "code-quality", "maintainability", "structure"]
	role: agentRole.role
	file: "./task.md"
	prompt: """
		{{.file_contents}}

		## Custom Instructions

		{{.instructions}}
		"""
}
