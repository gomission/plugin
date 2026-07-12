---
description: "Drafts and approval packets waiting for review"
argument-hint: "[--limit N]"
---

# /mission drafts

## Steps

1. Call `mission_status` if not yet called this session.
2. Dispatch:
   - If `mcp__gomission__mission_draft_queue` is available, call it with the limit (default 10).
   - Else if `mcp__gomission__mission_ask` is available, call `query: "List my local drafts and approval packets waiting for review. For each: title, status, age, and whether a packet is ready."`
   - Else refuse.
3. Render one line per draft: `<title> — <status> — <age>`. Mark packet-ready drafts with `[packet ready]`.
4. End with: `Approve one: /mission:approve <intent>`
