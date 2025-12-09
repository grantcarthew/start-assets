package dependencyanalysis

import (
	"github.com/grantcarthew/start-assets/schemas@v0"
	agentRole "github.com/grantcarthew/start-assets/roles/golang/agent@v0:agent"
)

task: schemas.#Task & {
	description: "Analyse project dependencies for security, maintenance, and compatibility"
	tags: ["golang", "dependencies", "security", "maintenance", "go-mod"]
	role: agentRole.role
	file: "./task.md"
	prompt: """
		{{.file_contents}}

		## Custom Instructions

		{{.instructions}}
		"""
}
