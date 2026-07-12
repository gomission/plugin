---
description: "Walk a planned action through the Trust Graduation ceremony"
argument-hint: "<one-line intent> [--class ACTION_CLASS]"
---

# /mission approve

Walk a planned consequential action through Mission's Trust Graduation ceremony. Mission gates — it does not execute. The tool that actually does the work (Gmail send, Slack post, publish) runs only after approval.

## Ceremony (surface-agnostic)

1. Call `mcp__gomission__mission_status` if not yet called this session. Obey `agent_instructions`.
2. Parse `$ARGUMENTS`: one-line intent + optional `--class`. If empty, refuse and ask for the intent.
3. **Classify** (if `mcp__gomission__mission_classify` is available):
   - Call it with `intent` and (if known) `tool_name` and `recipient_hint`. Get the canonical `action_class`.
   - If the tool is not available (local serve mode), use the `--class` from `$ARGUMENTS`, else default to `draft.compose` and note that classification was skipped.
4. Show the classification: "Mission classifies this as `<action_class>`."
5. **Request approval.** Call `mcp__gomission__request_approval` with `action_class`, `summary` (the one-line intent), and `evidence` (any relevant refs). Capture the receipt_id.
6. **Poll or ask** (if `mcp__gomission__mission_check_approval` is available):
   - Poll every 2 seconds up to 60 seconds. If pending after 60s, return the receipt ref and stop.
   - If the tool is not available (local serve), tell the user to open the packet directly and re-run `/mission:receipts --id <id>` to check.
7. On `approved` + `should_proceed = true`: report and hand back to the caller so the actual tool call can run.
8. On `denied`: report and stop.
9. After the caller executes, call `mcp__gomission__log_action` and return the receipt via `mcp__gomission__get_receipt`.

## Non-consequential actions

If classification returns an internal-only class, skip `request_approval` and go directly to `log_action`. Mission decides — do not second-guess.

## Ground rules

- The ceremony is the product. Never skip `request_approval` for external classes.
- This command walks the ceremony; it does not execute the underlying tool.
- Receipts are the truth.
- If `mission_status` is unavailable, refuse and point at `/mission:doctor`.
