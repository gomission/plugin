---
description: "Review pending Mission findings and receipts"
argument-hint: "[--since DATE] [--class ACTION_CLASS]"
allowed-tools: ["mcp__gomission__mco_review", "mcp__gomission__mco_findings_list"]
---

# /mission review

Show what Mission has recorded — findings, receipts, pending approvals.

## Steps

1. Call `mcp__gomission__mco_findings_list` with the filters from `$ARGUMENTS`.
2. If findings exist, group by action class. For each class show: count, oldest pending, top 3 most recent.
3. Call `mcp__gomission__mco_review` for the current session's proposed actions.
4. Present in this order: pending approvals first (loudest), recent receipts second, older findings last.

## Voice

This is an evidence surface. State what Mission actually recorded. Do not summarize what "probably happened" — either the receipt exists or it doesn't.
