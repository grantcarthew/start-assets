package codereview

import "github.com/grantcarthew/start-assets/schemas@v0"

task: schemas.#Task & {
	description: "Comprehensive Go code review for correctness, design, and idiomatic patterns"
	tags: ["golang", "review", "code-quality", "best-practices"]
	file: "./task.md"
}
