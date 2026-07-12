---
description: "Today's prompt — the ~5-8 sentence execution paragraph"
argument-hint: "[--edit] [--run]"
---

# /mission today

Generate today's prompt. The prompt is the executable payload — running it dispatches through the Mission Trust Graduation gate.

## Steps

1. Invoke the `today-prompt` skill to produce the paragraph.
2. Present the paragraph as-is (no headers, no bullet reformatting — Ronen wants prose he can read like a note to himself).
3. Below the paragraph, show four affordances on separate lines:
   - `[Run]` → user types `/mission:run` (executes deterministic subset, cards up external writes)
   - `[Edit]` → user replies with an edited version; the edit is captured as training signal (weight 1x per voice signal hierarchy)
   - `[Show week]` → user types `/mission:week`
   - `[Show month]` → user types `/mission:month`

## Modifiers

- `--edit` — Skip generation. Present the last generated Today prompt in an editable form; capture the user's rewrite as a training pair.
- `--run` — Generate, then immediately dispatch through `/mission:run`. Only permitted when Autonomy mode is set for the Today tab in Mission's trust tier config; otherwise refuse and explain.

## Voice

Short sentences. No em dashes. No art-speak. Declarative. Concrete. If the paragraph contains vague phrasing ("work on X," "look at Y"), rewrite before presenting.
