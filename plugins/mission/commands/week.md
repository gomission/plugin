---
description: "This week's synthesis — open loops, draft queue, receipt coverage"
argument-hint: "[--edit]"
---

# /mission week

Surface-agnostic. Rich synthesis when structured tools are available; natural-language dispatch otherwise.

## Steps

1. Call `mission_status` if not yet called this session.
2. Dispatch:
   - **Structured path** (if `mcp__gomission__mission_open_loops` is available):
     - Call in parallel: `mission_open_loops` (10), `mission_draft_queue` (10), `mission_receipts` (10), `mission_today` (3).
     - Synthesize client-side.
   - **Ask path** (else if `mcp__gomission__mission_ask` is available):
     - Call with `query: "What closes this week? Include silent loops (5+ days no touch), the one bet of the week, and the approval backlog count with age of the oldest pending."`
   - Else refuse; suggest `/mission:doctor`.
3. Present three blocks:
   - **Closes this week** — one paragraph from open loops + today ship item.
   - **Silent 5+ days** — one line per stale loop. If none, write "No silent loops."
   - **Approval backlog** — "<N> drafts waiting; oldest <age>."
4. Affordances: `/mission:approve  /mission:drafts  /mission:loops`

## Voice + grounding

Same rules as `/mission:today`. Never fabricate. If mission_ask is used, trust its response but still reshape into the three blocks.
