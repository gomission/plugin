---
description: "Walk a planned action through the Trust Graduation ceremony"
argument-hint: "<one-line intent> [--class ACTION_CLASS]"
allowed-tools: ["mcp__gomission__mission_status", "mcp__gomission__mission_classify", "mcp__gomission__request_approval", "mcp__gomission__mission_check_approval", "mcp__gomission__log_action", "mcp__gomission__get_receipt"]
---

# /mission approve

Walk a planned consequential action through Mission's Trust Graduation ceremony. Mission itself does not execute — it gates. The tool that actually does the work (Gmail, Slack, publish, etc.) runs only after `mission_check_approval` returns `should_proceed: true`.

## Ceremony

1. Call `mcp__gomission__mission_status` if not yet called this session. Obey `agent_instructions`.
2. Parse `$ARGUMENTS` as: one-line intent + optional `--class`. If empty, refuse and ask for the intent.
3. Call `mcp__gomission__mission_classify` with `intent` and (if known) `tool_name` and `recipient_hint`. Get the canonical `action_class`.
4. Show the classification to the user in one sentence: "Mission classifies this as `<action_class>`."
5. Call `mcp__gomission__request_approval` with `action_class`, `summary` (the one-line intent), and `evidence` (any relevant refs).
6. Show the approval reference the user is being asked to decide on.
7. Poll `mcp__gomission__mission_check_approval` with the returned receipt_id until `decision` resolves. Do not loop faster than every 2 seconds. Stop after 60 seconds and tell the user to open the approval packet.
8. If `decision = approved` and `should_proceed = true`: report approval and hand back to the caller so the actual tool call can run.
9. If `decision = denied`: report the denial and stop. Do not attempt.
10. After the caller executes the action, call `mcp__gomission__log_action` and return the receipt via `mcp__gomission__get_receipt`.

## Non-consequential actions

If `mission_classify` returns an internal-only class (draft.compose, log-only), you may skip `request_approval` and go directly to `log_action`. Mission itself decides — do not second-guess the classifier.

## Ground rules

- The ceremony is the product. Never skip classify + approval for external classes.
- Never execute the underlying tool call yourself from this command — this command only walks the ceremony. The caller (or the user) executes the tool.
- Receipts are the truth. A run with no receipt is a failed run.
- If any Mission tool is unavailable, refuse and point at `/mission:doctor`. Do not guess.
