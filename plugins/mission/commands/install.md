---
description: "Install Mission's MCP boundary (wrap / local / remote)"
argument-hint: "[--wrap|--local|--remote]"
allowed-tools: ["Bash(npx -y @gomission/mcp install-claude:*)"]
---

# /mission install

Configure the Mission MCP boundary in Claude Code. Three modes:

- `--wrap` — Intercepts configured MCP servers and blocks consequential calls with an approval ceremony. Fails closed. Recommended when other consequential MCPs are configured.
- `--local` — Exposes Mission's approval tools with persistent local receipts. No interception.
- `--remote` — Read-only remote surface. No enforcement, no interception. Safe default for evaluation.

No argument = auto-select `--wrap` if any consequential MCPs are present, else `--local`.

## Execution

```!
npx -y @gomission/mcp install-claude $ARGUMENTS
```

After the install script runs, tell the user to restart Claude Code so the new MCP config takes effect. Then run `/mission:verify` to confirm the boundary is live.
