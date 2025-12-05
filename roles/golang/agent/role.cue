package role

import "github.com/grantcarthew/start-schemas@v0:schemas"

role: schemas.#Role & {
	description: "Go programming language expert - autonomous agent mode"
	tags: ["golang", "programming", "agent", "autonomous", "automation"]
	file: "./role.md"
}
