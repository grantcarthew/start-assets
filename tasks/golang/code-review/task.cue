package codereview

import (
	"github.com/grantcarthew/start-assets/schemas@v0"
	agentRole "github.com/grantcarthew/start-assets/roles/golang/agent@v0:agent"
)

task: schemas.#Task & {
	description: "Comprehensive Go code review for correctness, design, and idiomatic patterns"
	tags: ["golang", "review", "code-quality", "best-practices"]
	role: agentRole.role
	file: "./task.md"
	prompt: """
		{{.file_contents}}

		## Custom Instructions

		{{.instructions}}
		"""
}
