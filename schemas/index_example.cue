package schemas

// Example index for asset discovery
// Keys match user input: "category/item"
// Module paths include full category: start-task-category-item
// Directory structure: tasks/category/item/

index: #Index & {
	tasks: {
		"golang/code-review": {
			module:      "github.com/grantcarthew/start-task-golang-code-review@v0"
			description: "Review Go code changes before committing"
			tags: ["golang", "review", "git", "quality"]
			version: "v0.1.0"
		}

		"golang/lint": {
			module:      "github.com/grantcarthew/start-task-golang-lint@v0"
			description: "Run golangci-lint on codebase"
			tags: ["golang", "lint", "quality", "static-analysis"]
			version: "v0.1.0"
		}

		"git/pre-commit": {
			module:      "github.com/grantcarthew/start-task-git-pre-commit@v0"
			description: "Run comprehensive pre-commit checks"
			tags: ["git", "hooks", "quality", "ci"]
			version: "v0.1.0"
		}

		"debug/help": {
			module:      "github.com/grantcarthew/start-task-debug-help@v0"
			description: "Get AI assistance debugging code issues"
			tags: ["debug", "help", "troubleshooting", "ai"]
			version: "v0.1.0"
		}
	}

	roles: {
		"programming/go-expert": {
			module:      "github.com/grantcarthew/start-role-programming-go-expert@v0"
			description: "Expert in Go programming language and ecosystem"
			tags: ["golang", "expert", "programming"]
			version: "v0.1.0"
		}

		"review/code-reviewer": {
			module:      "github.com/grantcarthew/start-role-review-code-reviewer@v0"
			description: "Code review and quality assurance specialist"
			tags: ["review", "quality", "best-practices"]
			version: "v0.1.0"
		}
	}

	agents: {
		"ai/claude": {
			module:      "github.com/grantcarthew/start-agent-ai-claude@v0"
			description: "Anthropic Claude AI agent configuration"
			tags: ["ai", "anthropic", "claude", "llm"]
			version: "v0.1.0"
			bin:         "claude"
		}

		"ai/gemini": {
			module:      "github.com/grantcarthew/start-agent-ai-gemini@v0"
			description: "Google Gemini AI agent configuration"
			tags: ["ai", "google", "gemini", "llm"]
			version: "v0.1.0"
			bin:         "gemini"
		}

		"ai/ollama": {
			module:      "github.com/grantcarthew/start-agent-ai-ollama@v0"
			description: "Ollama local LLM runner"
			tags: ["ai", "ollama", "local", "llm"]
			version: "v0.1.0"
			bin:         "ollama"
		}

		"ai/aichat": {
			module:      "github.com/grantcarthew/start-agent-ai-aichat@v0"
			description: "Multi-provider AI CLI tool"
			tags: ["ai", "aichat", "multi-provider"]
			version: "v0.1.0"
			bin:         "aichat"
		}
	}
}

// Example resolution flows:
//
// 1. Direct lookup:
//    $ start task golang/code-review
//    → index.tasks["golang/code-review"].module
//    → cue mod get github.com/grantcarthew/start-task-golang-code-review@v0
//
// 2. Search (multiple results):
//    $ start task review
//    → Search index.tasks for "review" in keys/descriptions/tags
//    → Found: golang/code-review, review/code-reviewer
//    → Interactive picker
//
// 3. Search (single result):
//    $ start task golang lint
//    → Search index.tasks for "golang" AND "lint"
//    → Found: golang/lint (only match)
//    → Auto-use it
//
// 4. Direct module URL:
//    $ start task github.com/someone/custom-task@v0
//    → Detect domain in path
//    → Skip index, direct cue mod get
