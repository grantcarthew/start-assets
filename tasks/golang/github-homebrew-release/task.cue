package githomebrew

import (
	"github.com/grantcarthew/start-assets/schemas@v0"
	assistantRole "github.com/grantcarthew/start-assets/roles/golang/assistant@v0:assistant"
)

task: schemas.#Task & {
	description: "Release Go project to GitHub with Homebrew tap distribution"
	tags: ["golang", "release", "github", "homebrew", "ci-cd"]
	role: assistantRole.role
	file: "@module/task.md"
	prompt: """
		{{.file_contents}}

		## Custom Instructions

		{{.instructions}}
		"""
}
