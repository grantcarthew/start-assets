package teacher

import "github.com/grantcarthew/start-assets/schemas@v0"

role: schemas.#Role & {
	description: "Go programming language expert - instructional teacher mode"
	tags: ["golang", "programming", "teacher", "instructional", "learning"]
	file: "@module/role.md"
}
