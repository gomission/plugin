---
description: "Escalate or reconfigure the Mission MCP boundary"
argument-hint: "[--wrap|--local|--remote]"
allowed-tools: ["Bash(npx -y @gomission/mcp install-claude:*)"]
---

# /mission install

The plugin already ships a **local** Mission MCP server via `npx -y @gomission/mcp serve` (declared in the plugin's `.mcp.json`). You have Mission tools available out of the box.

`/mission install` writes an entry into your **user Claude config** — this is a separate layer that can add wrap-mode enforcement over your other MCP servers, or switch to a different mode. Three options:

- `--wrap` — Intercepts your other configured MCP servers (Gmail, Slack, etc.) and blocks consequential calls with an approval ceremony. Fails closed. Recommended when you have other consequential MCPs.
- `--local` — Adds a second local Mission server at the user-config layer. Rarely useful because the plugin already provides one; use this if you need Mission running outside the plugin context (Claude Desktop, other clients).
- `--remote` — Adds the hosted MCP endpoint. Requires either bearer token via `--token <t>` or Claude Desktop's OAuth. Not usable from Claude Code without a token.

No argument = auto-recommend based on your existing user config.

## Execution

```!
npx -y @gomission/mcp install-claude $ARGUMENTS
```

## After install

1. Restart Claude Code so the new MCP config takes effect.
2. Run `/mission:verify` to confirm the boundary is live.
3. If you now have both the plugin's server AND a user-config server, you'll see duplicate `mission_*` tools. Either uninstall the plugin's copy or don't run `install --local`. `/mission:doctor` will flag this.

## Ground rule

Every mode exposes the same tool surface (`mission_*`, `request_approval`, etc.). The difference is enforcement scope and where the MCP entry lives.
