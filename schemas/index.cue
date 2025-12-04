package schemas

// #IndexEntry defines metadata for discovering and installing assets from the registry.
// The index maps friendly names to module paths, enabling CLI search and discovery.
#IndexEntry: {
	// module is the full OCI module path
	module: string & =~"^[a-z0-9.-]+/[a-z0-9/_-]+@v[0-9]+$"

	// description for search and display
	description?: string

	// tags for categorization and search
	tags?: [...string]

	// version info (latest published version)
	version?: string & =~"^v[0-9]+\\.[0-9]+\\.[0-9]+$"

	// bin is the executable name for PATH detection (agents only)
	// Used by auto-setup to detect installed AI CLI tools
	bin?: string & !=""
}

// #Index defines the structure for the asset discovery index.
// This enables CLI search without requiring access to OCI catalog API.
//
// Keys use category/name format (e.g., "golang/code-review", "git/pre-commit")
// This maps directly to the directory structure and module naming.
#Index: {
	// tasks maps "category/name" to module info
	// Examples: "golang/code-review", "git/pre-commit", "debug/help"
	tasks?: [string]: #IndexEntry

	// roles maps "category/name" to module info
	// Examples: "programming/go-expert", "review/code-reviewer"
	roles?: [string]: #IndexEntry

	// agents maps "category/name" to module info
	// Examples: "ai/claude", "ai/gemini"
	agents?: [string]: #IndexEntry

	// contexts maps "category/name" to module info
	// Examples: "env/local", "project/details"
	contexts?: [string]: #IndexEntry
}
