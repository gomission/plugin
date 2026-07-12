---
name: week-prompt
description: "Generate this week's execution paragraph plus the microgoals-moving block. Use when /mission:week is invoked or when the executor needs Week's payload."
---

# Week Prompt

Two artifacts. Return both, separated by a single blank line.

## Artifact 1 — The week paragraph

Same voice rules as Today. Shape:

1. Opening: closes this week. What must land by Friday.
2. Middle: goals showing no movement — name them and say what week-of-nothing looks like if unchanged.
3. Closing: the one bet of the week. What Ronen is trading focus for.

Grounded in: tasks due this week + microgoals with active work + goals with `movement_last_7_days = 0`.

## Artifact 2 — Microgoals moving

One line per active microgoal. Format:

```
- <microgoal name> — <status> — last movement <relative time>
```

At the end of the block, if any active microgoal has `last_movement > 5 days`, append:

```
Silent 5+ days: <name>, <name>
```

Do not omit this line if silent microgoals exist. It is the single highest-leverage signal Week provides that Today cannot.

## Voice rules

Identical to today-prompt. Reread them.

## Grounding rules

- Every microgoal listed must exist in state. Do not invent.
- Do not include microgoals whose parent goal is marked killed or paused.
- If no microgoals are active, say so in the second artifact: "No active microgoals." That itself is a signal worth surfacing.

## Output

Paragraph, blank line, microgoal block. Nothing else.
