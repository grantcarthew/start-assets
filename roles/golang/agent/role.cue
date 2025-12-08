package agent

import "github.com/grantcarthew/start-assets/schemas@v0"

role: schemas.#Role & {
	description: "Go programming language expert - autonomous agent mode"
	tags: ["golang", "programming", "agent", "autonomous", "automation"]
	file: "./role.md"
}
