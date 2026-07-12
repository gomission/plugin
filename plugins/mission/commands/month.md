---
description: "This month's prompt + full goal/microgoal/task control surface"
argument-hint: "[--edit] [--reshape]"
---

# /mission month

Three blocks:

1. **Proposed month-shape** — one paragraph from the `month-prompt` skill. This is a *proposal*, not authoritative. Ronen rewrites; the rewrite becomes truth.
2. **Goals → Microgoals → Tasks** — the full tree, reorderable. Show as a compact indented list, not a table. For each row show status + last-movement date. Do not show timestamps in ISO — use "3d ago", "yesterday", "today".
3. **Drift zones + unassigned time** — one paragraph flagging: goals with no active microgoals, microgoals with no active tasks, calendar blocks with no assigned work.

## Modifiers

- `--edit` — Editable month paragraph only, skip tree and drift block.
- `--reshape` — Take the user's next message as a full rewrite of the month-shape paragraph and treat it as the new authoritative shape; regenerate Today and Week from it.

## Control-surface rule

Every row must be actionable in one keystroke. Reorderable, promotable, killable. If the surface renders as read-only, it fails the Ive criterion — say so and stop.
