---
description: "Receipt coverage and recent receipt evidence"
argument-hint: "[--limit N] [--id RECEIPT_ID]"
---

# /mission receipts

Receipts are the truth — an action with no receipt didn't happen.

## Steps

1. Call `mission_status` if not yet called this session.
2. If `$ARGUMENTS` contains `--id RECEIPT_ID`, call `mcp__gomission__get_receipt` and render the full receipt. Stop.
3. Otherwise dispatch:
   - If `mcp__gomission__mission_receipts` is available, call with the limit (default 10).
   - Else if `mcp__gomission__mission_ask` is available, call `query: "Show receipt coverage: how many of my recent actions have receipts, and list the last 10 with action_class, summary, and age."`
   - Else refuse.
4. Two blocks: **Coverage** (`N of M actions have receipts (K%).`) and **Recent** (one line each).
5. End with: `/mission:receipts --id <id> for full receipt`
