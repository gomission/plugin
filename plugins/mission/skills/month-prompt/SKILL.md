---
name: month-prompt
description: "Generate the month-shape paragraph, the goals/microgoals/tasks tree, and the drift zones block. Use when /mission:month is invoked."
---

# Month Prompt

Three artifacts. Return in order, separated by blank lines.

## Artifact 1 — Month-shape paragraph

Proposed month-shape. Not authoritative — Ronen rewrites and the rewrite becomes truth.

Shape: one paragraph, 4-7 sentences. What the month is *about* if the current goal set stays. Name the goals by their real names. Name the trades: what gets neglected if the current shape holds. End with the one question Ronen should answer to decide whether to reshape.

## Artifact 2 — Goals → Microgoals → Tasks tree

Compact indented list. Not a table.

```
<Goal name> — <status> — <last movement>
  <Microgoal name> — <status> — <last movement>
    <Task name> — <status> — <due>
    <Task name> — <status> — <due>
  <Microgoal name> — <status> — <last movement>
    ...
<Goal name> — <status> — <last movement>
  ...
```

Times as "3d ago," "yesterday," "today," "in 2d." Never ISO timestamps.

## Artifact 3 — Drift zones + unassigned time

One paragraph. Three clauses:

1. Goals with no active microgoals — name them.
2. Microgoals with no active tasks — name them.
3. Calendar blocks (>2 hours) with no assigned work — count and name the days.

If no drift, say "No drift zones this month." Do not pad.

## Voice rules

Same as today-prompt. Reread if you're about to write "leverage."

## Grounding rules

- Every named entity must exist in state.
- Times must be computed from actual state, not guessed.
- If any state source is unreachable, name which one and skip only that artifact; do not fabricate around it.
