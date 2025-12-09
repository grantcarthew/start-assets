package performance

import (
	"github.com/grantcarthew/start-assets/schemas@v0"
	agentRole "github.com/grantcarthew/start-assets/roles/golang/agent@v0:agent"
)

task: schemas.#Task & {
	description: "Profile Go application, identify bottlenecks, and recommend optimizations"
	tags: ["golang", "performance", "profiling", "optimization", "pprof"]
	role: agentRole.role
	file: "@module/task.md"
	prompt: """
		{{.file_contents}}

		## Custom Instructions

		{{.instructions}}
		"""
}
