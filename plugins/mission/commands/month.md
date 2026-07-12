---
description: "This month's shape — search across Mission state, receipt coverage, drift zones"
argument-hint: "[--reshape]"
allowed-tools: ["mcp__gomission__mission_status", "mcp__gomission__mission_search", "mcp__gomission__mission_receipts", "mcp__gomission__mission_open_loops", "mcp__gomission__mission_draft_queue"]
---

# /mission month

There is no server-side `mission_month` tool. This command synthesizes from `mission_search` sweeps and receipt coverage. Will move server-side when Mission ships it.

## Steps

1. Call `mission_status` if not yet called this session.
2. Call `mission_search` twice with month-scale queries: `"active this month"` and `"waiting on decision"`. Limit 20 each.
3. Call `mission_receipts` (limit 20) — receipt coverage.
4. Call `mission_open_loops` (limit 20) and `mission_draft_queue` (limit 20).
5. Present three blocks:
   - **Month-shape paragraph** — 4-7 sentences. What this month is about based on the search + loops + receipts. Name goals/loops/drafts by their real refs. End with the one question Ronen should answer to decide whether to reshape.
   - **Coverage** — receipt coverage percentage + count of actions taken with receipts vs without. From `mission_receipts`.
   - **Drift zones** — one paragraph: loops with no receipt in 14+ days; drafts stuck in queue 7+ days; search results with no follow-up receipt.
6. Affordances: `/mission approve  /mission loops  /mission receipts`.

## Modifiers

- `--reshape` — Skip generation. Take the user's next message as the new authoritative month-shape and echo it back for confirmation.

## Voice rules

Same as today.md.

## Grounding rules

- Times as "3d ago," "yesterday," "in 2d." Never ISO timestamps.
- Every entity named must trace to a tool response.
- If any tool returns empty, name which one and skip only that block. Do not fabricate around it.
