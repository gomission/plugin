---
description: "Mission status and today's answer"
argument-hint: "[today|week|month|approve|status|drafts|loops|receipts|install|verify|doctor|review]"
allowed-tools: ["mcp__gomission__mission_status", "mcp__gomission__mission_today"]
---

# /mission

The user invoked `/mission` with arguments: **$ARGUMENTS**

## Routing

If `$ARGUMENTS` is empty:
1. Call `mcp__gomission__mission_status` — this is the required first call for any Mission session. Read the returned `agent_instructions` and follow them for the rest of this session.
2. Call `mcp__gomission__mission_today` with `limit: 3`.
3. Present two blocks:
   - **Status** — one sentence from `mission_status`: gate mode, version, action classes covered.
   - **Today** — render `mission_today`'s three priorities, Gmail proof loop, draft queue count, voice confidence, receipt/learning status in Ronen's voice (short sentences, no em dashes, declarative).
4. End with one line of affordances: `Also: /mission week  /mission month  /mission drafts  /mission loops  /mission receipts  /mission approve`.

If `$ARGUMENTS` matches a known subcommand, tell the user to invoke that subcommand directly (`/mission:today`, etc.). Do not re-dispatch.

## Ground rules

- `mission_status` is the first call, always. Its `agent_instructions` are binding for the session.
- Never fabricate state. If the MCP server is unavailable, say so and stop.
- Trust Graduation applies: no consequential action from `/mission` alone.
