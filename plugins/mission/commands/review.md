---
description: "Prepare or open an approval packet for human review"
argument-hint: "<title or source_ref> [--purpose TEXT] [--recommendation TEXT]"
allowed-tools: ["mcp__gomission__mission_status", "mcp__gomission__mission_prepare_approval_packet", "mcp__gomission__mission_open_approval_packet"]
---

# /mission review

Prepare a local Mission approval packet for a review — a workspace artifact + waiting receipt. This never sends, posts, or submits.

## Steps

1. Call `mission_status` if not yet called this session.
2. Parse `$ARGUMENTS`:
   - If it starts with a Mission ref (`task:*`, `draft:*`, `packet:*`, `receipt:*`), pass as `source_ref` to `mission_open_approval_packet`.
   - Otherwise treat the argument text as `title` and require `--purpose` and `--recommendation` flags; call `mission_prepare_approval_packet`.
3. Return the packet reference and a one-line summary.
4. Tell the user: "Open the packet to decide. `/mission approve` will not proceed until a human decision is recorded."

## Ground rules

- This command creates local review artifacts only. It does not execute the action being reviewed.
- If the user gave a title without `--purpose`, ask for the purpose in one sentence. Do not guess.
