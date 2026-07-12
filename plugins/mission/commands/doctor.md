---
description: "Diagnose Mission install, MCP config, and receipt trail"
allowed-tools: ["mcp__gomission__mco_doctor", "Bash(npx -y @gomission/mcp verify)"]
---

# /mission doctor

Run the Mission diagnostic and surface concrete next actions.

## Steps

1. Call `mcp__gomission__mco_doctor` to get the structured findings.
2. If the MCP server is not reachable, fall back to `npx -y @gomission/mcp verify` and report that output instead.
3. Present findings as a numbered punch list. Blunt, prioritized, name specific files or config keys. Do not soften.

## Output shape

```
1. <finding> — <exact fix>
2. <finding> — <exact fix>
...
```

If everything is healthy, say so in one sentence. Do not pad.
