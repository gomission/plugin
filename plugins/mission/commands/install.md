---
description: "Escalate Mission from read-only remote to local or wrap enforcement"
argument-hint: "[--wrap|--local|--remote]"
allowed-tools: ["Bash(npx -y @gomission/mcp install-claude:*)"]
---

# /mission install

The plugin ships with `gomission` wired to the **remote read-only** MCP endpoint (`https://gomission.io/mcp/`). That gives you status, findings, review, and doctor visibility with zero local processes.

`/mission install` escalates to real enforcement by writing to your user Claude config (separate from the plugin config). Three modes:

- `--wrap` — Intercepts your configured MCP servers and blocks consequential calls with an approval ceremony. Fails closed. Recommended when other consequential MCPs are configured.
- `--local` — Exposes Mission's approval tools with persistent local receipts and enables `mco_run` dispatch. No interception of other MCPs.
- `--remote` — Rewrites your user config to point at the hosted MCP. Same behavior as the plugin default, but at the user-config layer.

No argument = auto-select `--wrap` if any consequential MCPs are present, else `--local`.

## Execution

```!
npx -y @gomission/mcp install-claude $ARGUMENTS
```

## After install

1. Restart Claude Code so the new MCP config takes effect.
2. Run `/mission:verify` to confirm the boundary is live.
3. If you now have both the plugin's remote server AND a locally-installed enforcement server, you'll see duplicate tools. Either remove the plugin's `.mcp.json` entry or remove the user-config entry — whichever you don't want. `/mission:doctor` will flag this.

## Ground rule

`/mission run` requires the `mco_run` tool. Remote read-only does not expose it. If you want to dispatch, install `--local` or `--wrap`.
