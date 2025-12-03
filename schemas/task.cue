package schemas

// #Task defines the schema for task workflows.
// Tasks are reusable workflows that combine roles, agents, and dynamic content.
//
// Note: Tasks are identified by their map key (e.g., tasks["code-review"]).
// There is no 'name' field - the key IS the name.
#Task: {
	// Embed UTD pattern (file, command, prompt, shell, timeout)
	#UTD

	// Metadata
	description?: string
	tags?: [...string]

	// References (not inline definitions)
	role?:  string // Must exist in roles (validated at runtime)
	agent?: string // Must exist in agents (validated at runtime)
}
