package errorhandling

import (
	"github.com/grantcarthew/start-assets/schemas@v0"
	agentRole "github.com/grantcarthew/start-assets/roles/golang/agent@v0:agent"
)

task: schemas.#Task & {
	description: "Audit and improve error handling patterns throughout Go codebase"
	tags: ["golang", "errors", "error-handling", "best-practices", "audit"]
	role: agentRole.role
	file: "@module/task.md"
	prompt: """
		{{.file_contents}}

		## Custom Instructions

		{{.instructions}}
		"""
}
