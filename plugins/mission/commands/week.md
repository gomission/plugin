---
description: "This week's synthesis — open loops, draft queue, receipt coverage"
argument-hint: "[--edit]"
allowed-tools: ["mcp__gomission__mission_status", "mcp__gomission__mission_open_loops", "mcp__gomission__mission_draft_queue", "mcp__gomission__mission_receipts", "mcp__gomission__mission_today"]
---

# /mission week

There is no server-side `mission_week` tool yet — this command synthesizes from open loops, draft queue, and receipts. Client-side aggregation; will move server-side when Mission ships it.

## Steps

1. Call `mission_status` if not yet called this session.
2. Call in parallel:
   - `mission_open_loops` (limit 10) — unresolved relationship loops and promises
   - `mission_draft_queue` (limit 10) — drafts and approval packets waiting for review
   - `mission_receipts` (limit 10) — receipt coverage and recent evidence
   - `mission_today` (limit 3) — for a today anchor
3. Synthesize into three blocks:
   - **Closes this week** — one paragraph pulling from open loops that name a due-by or "waiting on user" state, plus the today anchor's ship item.
   - **Silent 5+ days** — from open loops with `last_touch > 5 days`. Name each. This is the highest-leverage signal — do not omit if any exist.
   - **Approval backlog** — count from draft queue + oldest pending timestamp. One sentence.
4. End with affordances: `/mission approve  /mission drafts  /mission loops`.

## Voice rules

Same as today-prompt. Reread the today.md voice block.

## Grounding rules

- Every loop/draft/receipt named must trace to a tool response.
- If no silent loops exist, say "No silent loops." Do not fabricate.
- If open_loops returns empty, say so. That is a signal.
