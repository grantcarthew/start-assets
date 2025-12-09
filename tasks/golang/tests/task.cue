package tests

import (
	"github.com/grantcarthew/start-assets/schemas@v0"
	agentRole "github.com/grantcarthew/start-assets/roles/golang/agent@v0:agent"
)

task: schemas.#Task & {
	description: "Generate tests for Go code including unit, integration, and benchmark tests"
	tags: ["golang", "testing", "unit-tests", "benchmarks", "coverage"]
	role: agentRole.role
	file: "./task.md"
	prompt: """
		{{.file_contents}}

		## Custom Instructions

		{{.instructions}}
		"""
}
