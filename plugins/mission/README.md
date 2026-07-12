# Mission — Claude Code Plugin

Mission is the Trust Graduation gate for agentic work. Claude prepares real work. Mission decides what Claude is allowed to do by action class, evidence, approval, and receipt.

This plugin gives Claude Code a today/week/month execution surface backed by the Mission MCP server.

## Install

```
/plugin marketplace add gomission/plugin
/plugin install mission@gomission
/mission install
```

`/mission install` runs `npx -y @gomission/mcp install-claude` and configures the MCP boundary. See install options below.

## Commands

- `/mission` — status + today's prompt
- `/mission today` — the ~5-8 sentence execution paragraph for today
- `/mission week` — this week's paragraph + microgoals moving + silent-microgoals flag
- `/mission month` — proposed month-shape + full goals/microgoals/tasks tree + drift zones
- `/mission run [prompt]` — dispatch through the Trust Graduation gate (preview → approve → dispatch → receipt)
- `/mission install [--wrap|--local|--remote]` — configure the MCP boundary
- `/mission verify` — confirm boundary is live
- `/mission doctor` — diagnose install + surface next actions
- `/mission review` — pending approvals, recent receipts, older findings

## Agent

- `mission-executor` — spawned when a run needs to walk a payload through the ceremony without blocking the main session. Also the target of mobile "run on desktop" custom prompts routed via the secure relay.

## Skills

- `today-prompt` — generates the Today paragraph, grounded in tasks/calendar/drafts/threads
- `week-prompt` — generates the Week paragraph + microgoals block
- `month-prompt` — generates the month-shape + tree + drift zones
- `custom-run` — rewrites a free-form user instruction into a Mission payload

## Trust Graduation

Nothing runs without approval. `/mission run` always previews action classes and predicted receipts before dispatch. External writes raise per-action approval cards mid-run. Receipts are the truth — a run with no receipt is a failed run.

## Ground rules

- Prompts are grounded in Mission state. If state is unreachable, commands refuse and point at `/mission:doctor` rather than fabricating.
- Voice on all generated text: short sentences, no em dashes, declarative, concrete.
- Trust Graduation applies to every dispatch. The ceremony is the product.

## Links

- Mission for Claude: https://claude.gomission.io/
- MCP package: https://www.npmjs.com/package/@gomission/mcp
- Trust Graduation: https://trustgraduation.org/
