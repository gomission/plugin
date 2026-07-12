---
description: "Open loops — unresolved relationships and promises"
argument-hint: "[--limit N]"
---

# /mission loops

## Steps

1. Call `mission_status` if not yet called this session.
2. Dispatch:
   - If `mcp__gomission__mission_open_loops` is available, call with the limit (default 10).
   - Else if `mcp__gomission__mission_ask` is available, call `query: "List my open loops — unresolved relationships and promises needing review. Split into waiting-on-me and waiting-on-them. Flag any with no touch in 5+ days."`
   - Else refuse.
3. Two blocks: **Waiting on you** and **Waiting on them** (with time-since-last-touch). At top, flag silent 5+ day loops: `Silent 5+ days: <name>`. Do not omit if any exist.
4. Affordances: `/mission:approve  /mission:drafts`
