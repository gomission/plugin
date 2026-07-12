---
description: "Open loops — unresolved relationships and promises"
argument-hint: "[--limit N]"
allowed-tools: ["mcp__gomission__mission_status", "mcp__gomission__mission_open_loops"]
---

# /mission loops

Show unresolved relationship loops and promises needing review.

## Steps

1. Call `mission_status` if not yet called this session.
2. Call `mcp__gomission__mission_open_loops` with the limit from `$ARGUMENTS` (default 10).
3. Group into two blocks:
   - **Waiting on you** — loops where the next action is Ronen's.
   - **Waiting on them** — loops where the next action is external, plus how long since last touch.
4. Flag any loop with `last_touch > 5 days` at the top: `Silent 5+ days: <name>`. Do not omit if any exist.
5. End with affordances: `/mission approve <intent>  /mission drafts`.

## Grounding

Every loop named must trace to a tool response. If the tool returns empty, say "No open loops." That itself is a signal.
