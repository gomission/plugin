---
description: "Today's Mission answer — three priorities, proof loop, drafts, receipts, next step"
argument-hint: "[--limit N]"
allowed-tools: ["mcp__gomission__mission_status", "mcp__gomission__mission_today"]
---

# /mission today

Render Mission's daily answer.

## Steps

1. Call `mcp__gomission__mission_status` if it hasn't been called this session; obey `agent_instructions`.
2. Call `mcp__gomission__mission_today` with the limit from `$ARGUMENTS` (default 3).
3. Reshape the response into a single readable block in Ronen's voice. Structure:
   - **Ship** — the top-priority action or draft to move today. One or two sentences.
   - **Reply** — the Gmail proof loop (if any).
   - **State** — draft queue count, voice confidence, receipt/learning status. One sentence.
   - **Next** — the one next step Mission recommends.
4. End with two affordances on one line: `/mission approve  /mission drafts`.

## Voice rules (strict)

- Short sentences.
- No em dashes. Use hyphens, commas, or periods.
- No art-speak. No "leverage," no "unlock," no "align."
- Declarative. No hedges.
- Concrete. Name the person, the draft, the loop by their real name if the tool returned it. Never "the client."

## Grounding rules

- Every sentence must trace to the tool's response. If `mission_today` returned no proof loop, do not write about a proof loop.
- If Mission's response is empty or thin, produce a shorter block. Do not pad.
- If the tool errors, refuse and tell the user to run `/mission:doctor`.
