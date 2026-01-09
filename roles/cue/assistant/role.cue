package assistant

import "github.com/grantcarthew/start-assets/schemas@v0"

role: schemas.#Role & {
	description: "CUE language and start-assets expert - collaborative assistant mode"
	tags: ["cue", "start-assets", "assistant", "collaborative"]
	file: "@module/role.md"
}
