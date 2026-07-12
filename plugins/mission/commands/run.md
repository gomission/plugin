---
description: "Execute the current prompt through the Mission Trust Graduation gate"
argument-hint: "[custom prompt text] [--tab today|week|month]"
allowed-tools: ["mcp__gomission__mco_run", "mcp__gomission__mco_review", "mcp__gomission__mco_memory_status"]
---

# /mission run

Dispatch a prompt through Mission. Two modes:

## Mode A — Run the current tab's generated prompt

Invoked with no argument text (or only `--tab today|week|month`). The last-generated prompt for that tab is sent to `mcp__gomission__mco_run` as the payload.

## Mode B — Custom prompt (mobile / desktop custom send)

Invoked with argument text. That text becomes the payload. This is the mobile "run on desktop" surface — the user is directing the executor from a small screen.

## Precondition — dispatch requires local enforcement

`/mission run` calls `mco_run`, which is only exposed by the local Mission MCP server (installed via `/mission install --local` or `--wrap`). The plugin's default remote endpoint is read-only and does not expose `mco_run`.

Before doing anything else, check whether `mcp__gomission__mco_run` is available. If it is not:
- Refuse cleanly.
- Tell the user: "Dispatch requires local enforcement. Run `/mission install --local` (or `--wrap` if you have other consequential MCPs), restart Claude Code, then try again."
- Do not attempt to work around this.

## Trust Graduation flow

Regardless of mode, do this in order:

1. Call `mcp__gomission__mco_review` with the payload to preview action classes and predicted receipts. Show the preview to the user.
2. Stop. Ask the user to approve or edit. Do not skip this step even if the tab is in Autonomy mode — the surface is Claude Code, which does not carry the mobile app's trust tier.
3. On approval, call `mcp__gomission__mco_run` with the payload. Stream the receipt back.
4. On any external write (send email, post, publish), Mission itself will raise a per-action approval card. Surface it and wait.

## Ground rules

- Never dispatch without a preview. The whole point of Mission is the approval ceremony.
- If the MCP server is unavailable, refuse and tell the user to run `/mission:doctor`.
- Receipts are the truth. If the run completed but no receipt was returned, treat it as failed.
