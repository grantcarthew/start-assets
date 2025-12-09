package securityaudit

import (
	"github.com/grantcarthew/start-assets/schemas@v0"
	agentRole "github.com/grantcarthew/start-assets/roles/golang/agent@v0:agent"
)

task: schemas.#Task & {
	description: "Security audit for vulnerabilities, weaknesses, and attack vectors in Go code"
	tags: ["golang", "security", "audit", "vulnerabilities", "owasp"]
	role: agentRole.role
	file: "./task.md"
	prompt: """
		{{.file_contents}}

		## Custom Instructions

		{{.instructions}}
		"""
}
