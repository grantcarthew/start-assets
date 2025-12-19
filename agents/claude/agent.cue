package claude

import "github.com/grantcarthew/start-assets/schemas@v0"

agent: schemas.#Agent & {
	bin:         "claude"
	command:     "{{.bin}} --model {{.model}} --permission-mode default --append-system-prompt-file {{.role_file}} {{.prompt}}"
	description: "Claude Code by Anthropic - agentic coding assistant"
	default_model: "sonnet"
	models: {
		haiku:  "haiku"
		sonnet: "sonnet"
		opus:   "opus"
	}
	tags: ["anthropic", "claude", "coding", "agent"]
}
