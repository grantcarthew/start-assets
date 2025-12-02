package schemas

// #Task defines the schema for task workflows.
// Tasks are reusable workflows that combine roles, agents, and dynamic content.
//
// Note: Tasks are identified by their map key (e.g., tasks["code-review"]).
// There is no 'name' field - the key IS the name.
#Task: {
	// Metadata
	description?: string
	tags?: [...string]

	// References (not inline definitions)
	role?:  string // Must exist in roles (validated at runtime)
	agent?: string // Must exist in agents (validated at runtime)

	// UTD pattern fields
	// Note: At least one of file, command, or prompt must be present
	// This is validated by Go at runtime (CUE can't express "at least one" constraint cleanly)
	file?:    string // Path to file (provides {{.file}}, {{.file_contents}})
	command?: string // Shell command (provides {{.command}}, {{.command_output}})
	prompt?:  string // Go template syntax with placeholders

	// Shell configuration
	shell?:   string & !=""      // Override global shell
	timeout?: int & >=1 & <=3600 // Timeout in seconds (no default - set in user config)
}
