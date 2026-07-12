---
description: "Verify Mission's MCP boundary and Trust Graduation config"
allowed-tools: ["Bash(npx -y @gomission/mcp verify)"]
---

# /mission verify

Confirm the Mission boundary is installed correctly and the Trust Graduation gate is active.

## Execution

```!
npx -y @gomission/mcp verify
```

Report the verification output verbatim. If the check fails, do not attempt to fix — tell the user to run `/mission:doctor` and share the doctor's output.
