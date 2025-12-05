package role

import "github.com/grantcarthew/start-schemas@v0:schemas"

role: schemas.#Role & {
	description: "Go programming language expert - instructional teacher mode"
	tags: ["golang", "programming", "teacher", "instructional", "learning"]
	file: "./role.md"
}
