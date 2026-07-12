---
name: month-prompt
description: "Synthesize the month from mission_search sweeps + receipt coverage + drift detection. There is no server-side mission_month tool yet. Use when /mission:month is invoked."
---

# Month Prompt

Client-side aggregation until Mission ships a server-side `mission_month`.

## Steps

1. Call in parallel:
   - `mcp__gomission__mission_search` with `query: "active this month"`, `limit: 20`
   - `mcp__gomission__mission_search` with `query: "waiting on decision"`, `limit: 20`
   - `mcp__gomission__mission_receipts` (limit 20)
   - `mcp__gomission__mission_open_loops` (limit 20)
   - `mcp__gomission__mission_draft_queue` (limit 20)
2. Synthesize three artifacts, blank line between each:

### Artifact 1 — Month-shape paragraph

4-7 sentences. Proposed month-shape, not authoritative. Name goals/loops/drafts by their real refs from the search results. End with the one question Ronen should answer to decide whether to reshape.

### Artifact 2 — Coverage

One line: `<N> of <M> actions have receipts (<K>%).` Pull from `mission_receipts`.

### Artifact 3 — Drift zones

One paragraph, three clauses:
1. Loops with no receipt in 14+ days — name them.
2. Drafts stuck in queue 7+ days — name them.
3. Search results with no follow-up receipt — count.

If no drift, write: `No drift zones this month.`

## Voice rules

Same as today-prompt.

## Grounding rules

- Times as "3d ago," "yesterday," "in 2d." Never ISO timestamps.
- Every entity named must trace to a tool response.
- If a tool errored, name which one; skip only that block; do not fabricate.

## Output

Three artifacts, separated by blank lines. Nothing else.
