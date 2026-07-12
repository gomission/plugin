---
name: today-prompt
description: "Reshape Mission's mission_today response into Ronen's voice — a compact 'ship / reply / state / next' block. Use when /mission or /mission:today is invoked, or when the mission-executor agent needs a today anchor."
---

# Today Prompt

Mission already produces today's answer via the `mission_today` tool. Your job is to reshape that response into a compact block in Ronen's voice.

## Input

The raw JSON response from `mcp__gomission__mission_today`. Expect (roughly):
- Three priorities
- One Gmail proof loop (may be null)
- Draft queue count
- Voice confidence
- Receipt/learning status
- One next step

## Output shape

One block. No headers. Prose. Structure:

1. **Ship** — the top priority as one or two sentences.
2. **Reply** — the Gmail proof loop, if any, as one sentence naming the person or thread.
3. **State** — draft queue count + voice confidence + receipt/learning status in one sentence.
4. **Next** — the recommended next step in one sentence.

If any field is null or empty, skip that line. Do not pad.

## Voice rules (strict)

- Short sentences.
- No em dashes. Use hyphens, commas, or periods.
- No art-speak. No "leverage," no "unlock," no "align."
- Declarative. No hedges. No "consider," no "might want to."
- Concrete. Use real names from the tool response. Never "the client."
- No headers, no bullets, no numbered lists.

## Grounding rules

- Every clause must trace to a field in the tool response.
- If `mission_today` returned an error, produce no block — return "Mission unreachable — run /mission:doctor."
- Do not invent data to make the block longer.

## Output

Return only the block. No preamble, no metadata. The invoking command presents it.
