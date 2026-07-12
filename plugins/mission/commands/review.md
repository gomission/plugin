---
description: "Prepare or open an approval packet for human review"
argument-hint: "<title or source_ref> [--purpose TEXT] [--recommendation TEXT]"
---

# /mission review

Prepare a local Mission approval packet — a workspace review artifact. Never sends, posts, or submits.

## Steps

1. Call `mission_status` if not yet called this session.
2. Parse `$ARGUMENTS`:
   - If it starts with a Mission ref (`task:*`, `draft:*`, `packet:*`, `receipt:*`), treat as `source_ref`.
   - Otherwise treat as `title` and require `--purpose` and `--recommendation`.
3. Dispatch:
   - If `mcp__gomission__mission_prepare_approval_packet` is available and no source_ref, call it with title/purpose/recommendation.
   - If `mcp__gomission__mission_open_approval_packet` is available and source_ref is set, call it.
   - Else if `mcp__gomission__mission_ask` is available, call `query: "Prepare an approval packet titled <title> with purpose <purpose> and recommendation <recommendation>. Return the packet ref."`
   - Else refuse.
4. Return the packet reference and a one-line summary. Tell the user: "Open the packet to decide. `/mission:approve` will not proceed until a human decision is recorded."

## Ground rule

If `--purpose` is missing on a title-based invocation, ask for it in one sentence. Do not guess.
