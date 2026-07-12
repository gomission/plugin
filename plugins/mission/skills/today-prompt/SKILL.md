---
name: today-prompt
description: "Generate Today's ~5-8 sentence execution paragraph, grounded in current Mission state. Use when /mission or /mission:today is invoked, or when the mission-executor agent needs Today's payload."
---

# Today Prompt

Produce one paragraph. That paragraph is the executable payload for Today.

## State to read

Read from the Mission workspace (typically `mission-data/` or the path from `mco_memory_status`):
- `tasks` — anything with `due_date <= today` or `status = overdue`
- `calendar` — today's events
- `drafts` — anything in `outbox/` marked ready-to-send
- `threads` — Gmail unreplied threads flagged high-priority
- `log` — yesterday's `daily-log.md` unfinished-work notes

Do **not** read: goals, microgoals (unless a task today directly serves one — then include the microgoal name in one clause).

## Shape

One paragraph. Roughly 5-8 sentences. Structure:

1. Opening sentence: ship. What must go out today.
2. Middle: reply. Which threads need words today.
3. Middle: don't-touch. What Ronen must *not* work on today (protect focus).
4. Closing sentence: one-line why. The single reason this shape matters.

## Voice rules (strict)

- Short sentences.
- No em dashes. Use hyphens, commas, or periods.
- No art-speak. No "leverage," no "unlock," no "align."
- Declarative. No hedges. No "consider," no "might want to."
- Concrete. Name the person, the file, the draft. Never "the client," always the actual name.
- No headers. No bullets. It's prose.

## Grounding rules

- Every claim in the paragraph must trace to a state read. If Ronen has no drafts ready, do not write "send the drafts."
- If today's state is thin (few tasks, no threads), write a shorter paragraph. Do not pad.
- If state is unreachable, produce no paragraph. Return "State unreachable — run /mission:doctor."

## Output

Return only the paragraph. No preamble, no metadata. The command that invoked this skill will present it.
