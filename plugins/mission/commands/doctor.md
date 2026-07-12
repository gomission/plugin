---
description: "Diagnose Mission install, MCP config, and receipt trail"
allowed-tools: ["mcp__gomission__mission_status", "Bash(npx -y @gomission/mcp verify)"]
---

# /mission doctor

Run diagnostics against the Mission MCP surface and surface concrete next actions.

## Steps

1. Call `mcp__gomission__mission_status`. Note gate mode, version, action classes, and any `agent_instructions` returned.
2. If the MCP server is not reachable at all, fall back to `npx -y @gomission/mcp verify` and report that output verbatim.
3. Compare what you got against what the plugin expects:
   - Server reachable? Which endpoint (remote read-only vs local enforcement)?
   - Gate mode active?
   - Version matches or exceeds 0.2.1?
   - Action classes returned?
4. If the user has both the plugin's remote server AND a locally-installed enforcement server, flag it: "You have Mission installed in two places; tools may be duplicated. Remove one entry."
5. Present findings as a numbered punch list. Blunt, prioritized, name specific config keys. Do not soften.

## Output shape

```
1. <finding> — <exact fix>
2. <finding> — <exact fix>
```

If everything is healthy, say so in one sentence. Do not pad.
