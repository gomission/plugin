---
name: week-prompt
description: "Synthesize the week from Mission's open loops, draft queue, and receipts. There is no server-side mission_week tool yet — this skill aggregates client-side. Use when /mission:week is invoked."
---

# Week Prompt

Three parallel tool calls, one synthesized block. When Mission ships a server-side `mission_week`, replace this skill with a thin wrapper.

## Steps

1. Call in parallel:
   - `mcp__gomission__mission_open_loops` (limit 10)
   - `mcp__gomission__mission_draft_queue` (limit 10)
   - `mcp__gomission__mission_receipts` (limit 10)
   - `mcp__gomission__mission_today` (limit 3) — for the today anchor
2. Synthesize into three artifacts, blank line between each:

### Artifact 1 — The week paragraph

4-6 sentences. Structure:
1. Opening: closes this week. What must land by Friday, drawn from open loops with due-by state + today's ship item.
2. Middle: coverage. From `mission_receipts`, one sentence on how many recent actions have receipts.
3. Closing: the one bet of the week. What Ronen is trading focus for, based on the highest-urgency open loop.

### Artifact 2 — Silent 5+ days

One line per open loop with `last_touch > 5 days`. Format:
```
Silent 5+ days: <loop name> (<age>)
```

If no silent loops, write: `No silent loops.`

### Artifact 3 — Approval backlog

One sentence: `<N> drafts waiting; oldest <age>.`

## Voice rules

Same as today-prompt. Reread if you're about to write "leverage."

## Grounding rules

- Every entity named must trace to a tool response.
- If a tool returned empty, name it explicitly and skip only that artifact.
- Do not invent silent loops to make the block feel important.

## Output

Three artifacts, separated by blank lines. Nothing else.
