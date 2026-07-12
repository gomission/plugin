---
description: "Today's Mission answer — three priorities, proof loop, drafts, receipts, next step"
argument-hint: "[--limit N]"
---

# /mission today

Render Mission's daily answer. Surface-agnostic.

## Steps

1. Call `mcp__gomission__mission_status` if not yet called this session; obey `agent_instructions`.
2. Dispatch:
   - If `mcp__gomission__mission_today` is available, call it with the limit from `$ARGUMENTS` (default 3).
   - Else if `mcp__gomission__mission_ask` is available, call with `query: "What should I approve today? Give me three priorities, one Gmail proof loop, draft queue count, voice confidence, receipt/learning status, and one next step."`
   - Else refuse; suggest `/mission:doctor`.
3. Reshape into one block in Ronen's voice:
   - **Ship** — top priority as one or two sentences.
   - **Reply** — the Gmail proof loop, if any, as one sentence naming the person or thread.
   - **State** — draft queue count + voice confidence + receipt/learning status in one sentence.
   - **Next** — the recommended next step in one sentence.
4. Affordances: `/mission:approve  /mission:drafts`

## Voice rules

- Short sentences.
- No em dashes. Use hyphens, commas, or periods.
- No art-speak.
- Declarative. No hedges.
- Concrete. Use real names from the tool response.
- No headers, no bullets.

## Grounding

- Every clause traces to the tool response.
- If the tool returned an error, surface it verbatim and stop.
- Do not invent data.
