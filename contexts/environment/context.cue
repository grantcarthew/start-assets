package environment

import "github.com/grantcarthew/start-assets/schemas@v0"

context: schemas.#Context & {
	required:    true
	default:     true
	description: "Local environment information including user, system, and tool context"
	tags: ["environment", "system", "user"]
	file:   "~/Context/ENVIRONMENT.md"
	prompt: "Read the {{.file}} file to gain local environment context."
}
