---
description: "This month's shape — coverage, drift zones, month-shape paragraph"
argument-hint: "[--reshape]"
---

# /mission month

Surface-agnostic.

## Steps

1. Call `mission_status` if not yet called this session.
2. Dispatch:
   - **Structured** (if `mcp__gomission__mission_search` is available):
     - Parallel: `mission_search "active this month"` (20), `mission_search "waiting on decision"` (20), `mission_receipts` (20), `mission_open_loops` (20), `mission_draft_queue` (20).
     - Synthesize client-side.
   - **Ask** (else if `mcp__gomission__mission_ask` is available):
     - `query: "Give me this month's shape: 4-7 sentences on what the month is about, receipt coverage as N of M actions (K%), and drift zones — loops with no receipt in 14+ days, drafts stuck 7+ days, search results with no follow-up receipt. End with the one question I should answer to decide whether to reshape."`
   - Else refuse.
3. Present three blocks: month-shape paragraph, coverage line, drift zones paragraph.
4. Affordances: `/mission:approve  /mission:loops  /mission:receipts`

## Modifier

- `--reshape` — Take the user's next message as the new month-shape; echo back for confirmation.

## Voice + grounding

Same rules. Times as "3d ago," never ISO timestamps.
