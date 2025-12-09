package project

import "github.com/grantcarthew/start-assets/schemas@v0"

context: schemas.#Context & {
	default:     true
	description: "Project-specific documentation from project.md"
	tags: ["project", "repository", "documentation"]
	file: "./project.md"
	prompt: "Read the {{.file}} file to gain context about the current project."
}
