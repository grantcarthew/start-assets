package agent

import "github.com/grantcarthew/start-assets/schemas@v0"

role: schemas.#Role & {
	description: "CUE language and start-assets expert - autonomous agent mode"
	tags: ["cue", "start-assets", "agent", "autonomous"]
	file: "@module/role.md"
}
