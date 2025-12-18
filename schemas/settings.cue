package schemas

// #Settings defines the schema for global start configuration settings.
// Settings control default behavior and runtime options.
//
// All fields are optional. When not specified, sensible defaults are used.
#Settings: {
	// default_agent is the agent to use when --agent flag is not specified.
	// Must match a key in the agents configuration.
	default_agent?: string & !=""

	// default_role is the role to use when --role flag is not specified.
	// Must match a key in the roles configuration.
	default_role?: string & !=""

	// shell is the default shell for command execution.
	// If not specified, auto-detects (bash > sh).
	shell?: string & !=""

	// timeout is the default command timeout in seconds.
	// Applies to UTD command execution when not overridden per-context.
	timeout?: int & >0
}
