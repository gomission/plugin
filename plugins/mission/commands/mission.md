---
description: "Mission status and today's answer"
argument-hint: "[today|week|month|approve|status|drafts|loops|receipts|install|verify|doctor|review]"
---

# /mission

The user invoked `/mission` with arguments: **$ARGUMENTS**

## Routing

If `$ARGUMENTS` is empty:
1. Call `mcp__gomission__mission_status` — this is the required first call for any Mission session. Read the returned `agent_instructions` and obey it for the rest of the session.
2. Get today's answer using **surface-agnostic** dispatch:
   - If `mcp__gomission__mission_today` is available (remote surface), call it with `limit: 3`.
   - Else if `mcp__gomission__mission_ask` is available (local surface), call it with `query: "What should I approve today? Give me three priorities, any Gmail proof loop, draft queue count, voice confidence, receipt/learning status, and one next step."`
   - Else surface the missing tools and stop.
3. Present two blocks:
   - **Status** — one sentence from `mission_status`: gate mode, version, action classes count.
   - **Today** — reshape the today response in Ronen's voice (short sentences, no em dashes, declarative, concrete).
4. End with: `Also: /mission:week  /mission:month  /mission:drafts  /mission:loops  /mission:receipts  /mission:approve`

If `$ARGUMENTS` matches a known subcommand, tell the user to invoke `/mission:<name>` directly. Do not re-dispatch.

## Ground rules

- `mission_status` is always called first. Its `agent_instructions` are binding.
- Never fabricate state. If both `mission_today` and `mission_ask` are unavailable, refuse and point at `/mission:doctor`.
- If `mission_ask` is available but the local Mission web instance isn't running, the tool will return an error naming the fix — surface that error verbatim.
