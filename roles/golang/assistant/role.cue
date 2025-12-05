package role

import "github.com/grantcarthew/start-assets/schemas@v0"

role: schemas.#Role & {
	description: "Go programming language expert - collaborative assistant mode"
	tags: ["golang", "programming", "assistant", "collaborative"]
	file: "./role.md"
}
