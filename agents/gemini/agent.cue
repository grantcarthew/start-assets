package gemini

import "github.com/grantcarthew/start-assets/schemas@v0"

agent: schemas.#Agent & {
	bin:         "gemini"
	command:     "GEMINI_SYSTEM_MD='{{.role_file}}' {{.bin}} --model {{.model}} --approval-mode default '{{.prompt}}'"
	description: "Gemini CLI by Google - agentic coding assistant"
	default_model: "gemini-2.5-pro"
	models: {
		flash:      "gemini-2.5-flash"
		"flash-lite": "gemini-2.5-flash-lite"
		pro:        "gemini-2.5-pro"
	}
	tags: ["google", "gemini", "coding", "agent"]
}
