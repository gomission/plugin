---
description: "Mission status and today's prompt"
argument-hint: "[today|week|month|run|install|verify|doctor|review]"
---

# /mission

The user invoked `/mission` with arguments: **$ARGUMENTS**

## Routing

If `$ARGUMENTS` is empty or matches `status`:
1. Call the `gomission` MCP server's `mco_memory_status` tool to read current Mission state.
2. Call the `today-prompt` skill to generate today's paragraph.
3. Present a two-part response:
   - **Status line** — one sentence, drawn from `mco_memory_status`: what's active, what's approved, what's pending.
   - **Today's prompt** — the generated paragraph, followed by `[Run] [Edit] [Show week] [Show month]` affordances.

If `$ARGUMENTS` starts with `today`, `week`, `month`, `run`, `install`, `verify`, `doctor`, or `review`:
- Tell the user to invoke that subcommand directly (e.g., `/mission:today`) — do not re-dispatch.

## Ground rules

- Never fabricate state. If the MCP server is unavailable, say so and stop — do not synthesize a status line.
- The prompts are grounded in the state at `mission-data/` (tasks, microgoals, goals, drafts, log). If those aren't accessible, say so and stop.
- Trust Graduation applies: nothing runs from `/mission` alone. Running requires an explicit `/mission:run` and lands through the Mission gate.
