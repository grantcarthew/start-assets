package teacher

import "github.com/grantcarthew/start-assets/schemas@v0"

role: schemas.#Role & {
	description: "CUE language and start-assets expert - educational teacher mode"
	tags: ["cue", "start-assets", "teacher", "educational"]
	file: "@module/role.md"
}
