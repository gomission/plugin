# Mission — Claude Code Plugin

Mission is the Trust Graduation gate for agentic work. Claude prepares real work. Mission decides what Claude is allowed to do by action class, evidence, approval, and receipt.

This plugin gives Claude Code a today/week/month execution surface backed by the Mission MCP server.

## Install

```
/plugin marketplace add gomission/plugin
/plugin install mission@gomission
```

The plugin wires `gomission` to a local Mission MCP server via `npx -y @gomission/mcp serve`. That's the default because it works out of the box — no auth handshake required.

Commands are **surface-agnostic** — they try the structured Mission tool first (`mission_today`, `mission_open_loops`, etc.) and fall back to `mission_ask` (natural-language proxy to the local Mission web instance) when the structured tool isn't exposed. Local serve exposes only `mission_ask` + the four gate tools; the hosted remote endpoint exposes the full structured surface. Either works.

**Note on `mission_ask`:** it proxies to a local Mission web instance on `http://127.0.0.1:8814`. Start it with `mission web 8814` in a separate terminal. If the web instance isn't running, `mission_ask` returns a clear error and the plugin surfaces it verbatim.

**Optional: opt into wrap enforcement**

If you also have other consequential MCP servers (Gmail, Slack, etc.), run:

```
/mission:install --wrap
```

This uses `@gomission/mcp install-claude --wrap` to intercept those MCPs at your user-config layer with an approval ceremony.

**Optional: use the hosted remote MCP**

The hosted MCP at `https://gomission.io/mcp/` requires OAuth with dynamic client registration, which Claude Code does not currently support. Claude Desktop can use it via the CLI's OAuth flow. If you want the remote surface in Claude Code, you'll need a bearer token — see `npx -y @gomission/mcp install-claude --remote --token <bearer>`.

## Commands

Slash commands are namespaced under `mission:`. Type any of:

- `/mission:mission` — required `mission_status` first-call + today's answer
- `/mission:today` — reshapes `mission_today` into a compact ship / reply / state / next block
- `/mission:week` — client-side synthesis over open loops, drafts, and receipts (until Mission ships a server-side week tool)
- `/mission:month` — client-side synthesis over `mission_search` sweeps + receipt coverage + drift zones
- `/mission:approve <intent>` — walks a planned action through the Trust Graduation ceremony (`mission_classify` → `request_approval` → `mission_check_approval` → `log_action` → `get_receipt`)
- `/mission:drafts` — `mission_draft_queue`
- `/mission:loops` — `mission_open_loops` with silent-5+-days flag
- `/mission:receipts` — `mission_receipts` coverage + recent evidence, or `--id` for a specific receipt
- `/mission:review <title|ref>` — creates or opens an approval packet
- `/mission:install [--wrap|--local|--remote]` — escalate the boundary
- `/mission:verify` — confirm boundary is live
- `/mission:doctor` — diagnose install + surface next actions

## Agent

- `mission-executor` — walks any planned consequential action through the Trust Graduation ceremony. Used by `/mission:approve` and by the mobile "run on desktop" relay for custom prompts.

## Skills

- `today-prompt` — reshapes `mission_today` into Ronen's voice
- `week-prompt` — client-side synthesis over open_loops + draft_queue + receipts + today
- `month-prompt` — client-side synthesis over search sweeps + receipts + drift
- `custom-run` — converts a free-form instruction into a Mission-executable intent

## Trust Graduation

Nothing external happens without approval. Mission does not execute — it gates. The tool that performs the work (Gmail, Slack, publish, etc.) runs only after `mission_check_approval` returns `should_proceed = true`. Receipts are the truth. A run with no receipt is a failed run.

## Ground rules

- Prompts are grounded in Mission state. If state is unreachable, commands refuse and point at `/mission:doctor` rather than fabricating.
- Voice on all generated text: short sentences, no em dashes, declarative, concrete.
- Trust Graduation applies to every consequential action. The ceremony is the product.

## Links

- Mission for Claude: https://claude.gomission.io/
- MCP package: https://www.npmjs.com/package/@gomission/mcp
- Trust Graduation: https://trustgraduation.org/
