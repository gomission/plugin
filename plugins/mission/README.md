# Mission — Claude Code Plugin

Mission is the Trust Graduation gate for agentic work. Claude prepares real work. Mission decides what Claude is allowed to do by action class, evidence, approval, and receipt.

This plugin gives Claude Code a today/week/month execution surface backed by the Mission MCP server.

## Install

```
/plugin marketplace add gomission/plugin
/plugin install mission@gomission
```

Two layers, use one or both:

**Layer 1 — plugin default (auto-installed)**
The plugin wires `gomission` to the read-only remote MCP at `https://gomission.io/mcp/`. You get status, findings, review, and doctor visibility immediately. No local process. Safe default. `/mission run` will refuse because dispatch is not exposed on the remote surface.

**Layer 2 — local enforcement (opt-in)**
```
/mission install --wrap   # or --local
```
Adds a local Mission server to your user Claude config with the Trust Graduation approval ceremony and `mco_run` dispatch. Restart Claude Code after.

If you install both layers, you'll see duplicate tools — remove one entry. `/mission doctor` will flag this.

## Commands

- `/mission` — required `mission_status` first-call + today's answer
- `/mission today` — reshapes `mission_today` into a compact ship / reply / state / next block
- `/mission week` — client-side synthesis over open loops, drafts, and receipts (until Mission ships a server-side week tool)
- `/mission month` — client-side synthesis over `mission_search` sweeps + receipt coverage + drift zones
- `/mission approve <intent>` — walks a planned action through the Trust Graduation ceremony (`mission_classify` → `request_approval` → `mission_check_approval` → `log_action` → `get_receipt`)
- `/mission drafts` — `mission_draft_queue`
- `/mission loops` — `mission_open_loops` with silent-5+-days flag
- `/mission receipts` — `mission_receipts` coverage + recent evidence, or `--id` for a specific receipt
- `/mission review <title|ref>` — creates an approval packet via `mission_prepare_approval_packet` or opens one via `mission_open_approval_packet`
- `/mission install [--wrap|--local|--remote]` — escalate from remote read-only to local enforcement
- `/mission verify` — confirm boundary is live
- `/mission doctor` — diagnose install + surface next actions

## Agent

- `mission-executor` — spawned when a run needs to walk a payload through the ceremony without blocking the main session. Also the target of mobile "run on desktop" custom prompts routed via the secure relay.

## Skills

- `today-prompt` — generates the Today paragraph, grounded in tasks/calendar/drafts/threads
- `week-prompt` — generates the Week paragraph + microgoals block
- `month-prompt` — generates the month-shape + tree + drift zones
- `custom-run` — rewrites a free-form user instruction into a Mission payload

## Trust Graduation

Nothing external happens without approval. The `/mission approve` command walks any planned consequential action through `mission_classify` → `request_approval` → `mission_check_approval` → `log_action` → `get_receipt`. Mission itself does not execute — it gates. The tool that actually performs the work (Gmail, Slack, publish) runs only after `should_proceed = true`. Receipts are the truth. A run with no receipt is a failed run.

## Ground rules

- Prompts are grounded in Mission state. If state is unreachable, commands refuse and point at `/mission:doctor` rather than fabricating.
- Voice on all generated text: short sentences, no em dashes, declarative, concrete.
- Trust Graduation applies to every dispatch. The ceremony is the product.

## Links

- Mission for Claude: https://claude.gomission.io/
- MCP package: https://www.npmjs.com/package/@gomission/mcp
- Trust Graduation: https://trustgraduation.org/
