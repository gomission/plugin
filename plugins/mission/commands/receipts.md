---
description: "Receipt coverage and recent receipt evidence"
argument-hint: "[--limit N] [--id RECEIPT_ID]"
allowed-tools: ["mcp__gomission__mission_status", "mcp__gomission__mission_receipts", "mcp__gomission__get_receipt"]
---

# /mission receipts

Show Mission's receipt coverage. Receipts are the truth — an action with no receipt didn't happen.

## Steps

1. Call `mission_status` if not yet called this session.
2. If `$ARGUMENTS` contains `--id RECEIPT_ID`:
   - Call `mcp__gomission__get_receipt` and render the full receipt.
   - Stop here.
3. Otherwise call `mcp__gomission__mission_receipts` with the limit from `$ARGUMENTS` (default 10).
4. Render two blocks:
   - **Coverage** — one sentence: "N of M actions have receipts (K%)."
   - **Recent** — one line per receipt: `<action_class> — <summary> — <age>`.
5. End with: `/mission receipts --id <id> for full receipt`.
