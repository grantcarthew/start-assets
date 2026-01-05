package schemas

// #Base defines common fields for all asset types.
// Embedded by #Agent, #Role, #Task, and #Context.
#Base: {
	// Human-readable description of the asset
	description?: string

	// Tags for categorization and filtering
	// Must be lowercase kebab-case
	tags?: [...string & =~"^[a-z0-9]+(-[a-z0-9]+)*$"]

	// Module path when installed from registry
	// Example: "start.cue.works/tasks/code-review"
	// Empty/undefined = user-defined asset
	origin?: string
}
