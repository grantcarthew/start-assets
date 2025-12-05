package role

import "github.com/grantcarthew/start-schemas@v0:schemas"

role: schemas.#Role & {
	description: "Go programming language expert - collaborative assistant mode"
	tags: ["golang", "programming", "assistant", "collaborative"]
	file: "./role.md"
}
