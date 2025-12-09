# Start Assets

CUE-based asset definitions for the `start` CLI tool.

## Overview

This repository contains reusable assets for configuring AI agents, roles, contexts, and tasks. All assets are defined using [CUE](https://cuelang.org/) and published to the CUE registry.

## Structure

```
start-assets/
├── agents/      # AI CLI tool definitions
├── contexts/    # Environmental context definitions
├── roles/       # System prompt and behaviour definitions
├── schemas/     # CUE schema definitions
└── tasks/       # Task instruction definitions
```

## Usage

Import assets from the CUE registry:

```cue
import "github.com/grantcarthew/start-assets/roles/golang/agent@v0"
```

## License

See [LICENSE](LICENSE) for details.
