---
description: "Drafts and approval packets waiting for review"
argument-hint: "[--limit N]"
allowed-tools: ["mcp__gomission__mission_status", "mcp__gomission__mission_draft_queue"]
---

# /mission drafts

Show local drafts and approval packets awaiting human review.

## Steps

1. Call `mission_status` if not yet called this session.
2. Call `mcp__gomission__mission_draft_queue` with the limit from `$ARGUMENTS` (default 10).
3. Render one line per draft: `<title> — <status> — <age>`. Age as relative time.
4. If a draft has an approval packet ready, mark it: `[packet ready]`.
5. End with: `Approve one: /mission approve <intent>`.

## Voice

Prose over table. Compact. No headers.
