package apidocs

import (
	"github.com/grantcarthew/start-assets/schemas@v0"
	agentRole "github.com/grantcarthew/start-assets/roles/golang/agent@v0:agent"
)

task: schemas.#Task & {
	description: "Review and improve API documentation for exported types and functions"
	tags: ["golang", "documentation", "godoc", "api", "comments"]
	role: agentRole.role
	file: "@module/task.md"
	prompt: """
		{{.file_contents}}

		## Custom Instructions

		{{.instructions}}
		"""
}
