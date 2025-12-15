package index

import "github.com/grantcarthew/start-assets/schemas@v0"

// Agent index - maps friendly names to module paths with bin for detection
agents: [string]: schemas.#IndexEntry

agents: {
	"ai/claude": {
		module:      "github.com/grantcarthew/start-assets/agents/claude@v0"
		description: "Claude Code by Anthropic - agentic coding assistant"
		bin:         "claude"
		tags: ["anthropic", "claude", "coding", "agent"]
	}
	"ai/gemini": {
		module:      "github.com/grantcarthew/start-assets/agents/gemini@v0"
		description: "Gemini CLI by Google - agentic coding assistant"
		bin:         "gemini"
		tags: ["google", "gemini", "coding", "agent"]
	}
	"ai/aichat": {
		module:      "github.com/grantcarthew/start-assets/agents/aichat@v0"
		description: "AIChat - All-in-one LLM CLI tool by sigoden"
		bin:         "aichat"
		tags: ["aichat", "multi-provider", "rag", "agents"]
	}
}

// Context index - maps friendly names to module paths
contexts: [string]: schemas.#IndexEntry

contexts: {
	"repo/agents": {
		module:      "github.com/grantcarthew/start-assets/contexts/agents@v0"
		description: "Repository-specific AI agent guidelines from AGENTS.md"
		tags: ["agents", "repository", "guidelines"]
	}
	"env/environment": {
		module:      "github.com/grantcarthew/start-assets/contexts/environment@v0"
		description: "Local environment information including user, system, and tool context"
		tags: ["environment", "system", "user"]
	}
	"repo/project": {
		module:      "github.com/grantcarthew/start-assets/contexts/project@v0"
		description: "Project-specific documentation from project.md"
		tags: ["project", "repository", "documentation"]
	}
}

// Role index - maps friendly names to module paths
roles: [string]: schemas.#IndexEntry

roles: {
	"golang/agent": {
		module:      "github.com/grantcarthew/start-assets/roles/golang/agent@v0"
		description: "Go programming language expert - autonomous agent mode"
		tags: ["golang", "programming", "agent", "autonomous", "automation"]
	}
	"golang/assistant": {
		module:      "github.com/grantcarthew/start-assets/roles/golang/assistant@v0"
		description: "Go programming language expert - collaborative assistant mode"
		tags: ["golang", "programming", "assistant", "collaborative"]
	}
	"golang/teacher": {
		module:      "github.com/grantcarthew/start-assets/roles/golang/teacher@v0"
		description: "Go programming language expert - instructional teacher mode"
		tags: ["golang", "programming", "teacher", "instructional", "learning"]
	}
}

// Task index - maps friendly names to module paths
tasks: [string]: schemas.#IndexEntry

tasks: {
	"golang/api-docs": {
		module:      "github.com/grantcarthew/start-assets/tasks/golang/api-docs@v0"
		description: "Review and improve API documentation for exported types and functions"
		tags: ["golang", "documentation", "godoc", "api", "comments"]
	}
	"golang/architecture": {
		module:      "github.com/grantcarthew/start-assets/tasks/golang/architecture@v0"
		description: "Analyse codebase structure, dependencies, and design patterns"
		tags: ["golang", "architecture", "design", "structure", "dependencies"]
	}
	"golang/code-review": {
		module:      "github.com/grantcarthew/start-assets/tasks/golang/code-review@v0"
		description: "Comprehensive Go code review for correctness, design, and idiomatic patterns"
		tags: ["golang", "review", "code-quality", "best-practices"]
	}
	"golang/debug": {
		module:      "github.com/grantcarthew/start-assets/tasks/golang/debug@v0"
		description: "Systematically debug and resolve issues in Go code"
		tags: ["golang", "debug", "troubleshooting", "bugs", "investigation"]
	}
	"golang/dependency-analysis": {
		module:      "github.com/grantcarthew/start-assets/tasks/golang/dependency-analysis@v0"
		description: "Analyse project dependencies for security, maintenance, and compatibility"
		tags: ["golang", "dependencies", "security", "maintenance", "go-mod"]
	}
	"golang/error-handling": {
		module:      "github.com/grantcarthew/start-assets/tasks/golang/error-handling@v0"
		description: "Audit and improve error handling patterns throughout Go codebase"
		tags: ["golang", "errors", "error-handling", "best-practices", "audit"]
	}
	"golang/performance": {
		module:      "github.com/grantcarthew/start-assets/tasks/golang/performance@v0"
		description: "Profile Go application, identify bottlenecks, and recommend optimizations"
		tags: ["golang", "performance", "profiling", "optimization", "pprof"]
	}
	"golang/refactor": {
		module:      "github.com/grantcarthew/start-assets/tasks/golang/refactor@v0"
		description: "Refactor Go code to improve structure, readability, and maintainability"
		tags: ["golang", "refactor", "code-quality", "maintainability", "structure"]
	}
	"golang/security-audit": {
		module:      "github.com/grantcarthew/start-assets/tasks/golang/security-audit@v0"
		description: "Security audit for vulnerabilities, weaknesses, and attack vectors in Go code"
		tags: ["golang", "security", "audit", "vulnerabilities", "owasp"]
	}
	"golang/tests": {
		module:      "github.com/grantcarthew/start-assets/tasks/golang/tests@v0"
		description: "Generate tests for Go code including unit, integration, and benchmark tests"
		tags: ["golang", "testing", "unit-tests", "benchmarks", "coverage"]
	}
}
