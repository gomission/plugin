# Anthropic marketplace submission

Ready-to-use materials for submitting `mission` to `anthropics/claude-plugins-official`.

Do not submit until v0.1 has real install/receipt data — Mission's own trust-graduation philosophy applies to Mission itself.

---

## 1. Marketplace entry to add

Insert this object into the `plugins` array of `.claude-plugin/marketplace.json` in `anthropics/claude-plugins-official`, alphabetically by `name`. Bump the `ref` and `sha` when tagging future releases.

```json
{
  "name": "mission",
  "description": "Mission is the Trust Graduation gate for agentic work. Claude prepares real work; Mission decides what Claude is allowed to do by action class, evidence, approval, and receipt. Adds /mission today, /mission week, /mission month execution prompts, a mission-executor agent for dispatch, and the Mission MCP server (read-only remote by default; opt into local enforcement with /mission install).",
  "author": {
    "name": "Mission",
    "email": "support@gomission.io"
  },
  "category": "productivity",
  "source": {
    "source": "git-subdir",
    "url": "https://github.com/gomission/plugin.git",
    "path": "plugins/mission",
    "ref": "v0.1.1",
    "sha": "8118f1aaf1d7bb59320914523929a0112d64ceeb"
  },
  "homepage": "https://claude.gomission.io/"
}
```

---

## 2. Submission steps

```bash
gh repo fork anthropics/claude-plugins-official --clone --remote
cd claude-plugins-official
git checkout -b add-mission-plugin

# Edit .claude-plugin/marketplace.json — insert the JSON above into plugins[]

git add .claude-plugin/marketplace.json
git commit -m "Add mission plugin (v0.1.1)"
git push -u origin add-mission-plugin
gh pr create --title "Add mission plugin (v0.1.1)" --body "$(cat ../gomission-plugin/docs/anthropic-marketplace-submission.md | awk '/^## 3\. PR body/,/^## 4\./' | sed '1d;$d')"
```

---

## 3. PR body

## Summary

Adds the `mission` plugin to the marketplace.

Mission is the Trust Graduation gate for agentic work. Claude prepares real work. Mission decides what Claude is allowed to do by action class, evidence, approval, and receipt.

This plugin gives Claude Code users:

- `/mission today`, `/mission week`, `/mission month` — AI-generated, human-readable execution prompts grounded in the user's actual task/goal state
- `/mission run` — dispatch through the Trust Graduation ceremony (preview → approve → dispatch → receipt)
- `/mission install`, `/mission verify`, `/mission doctor`, `/mission review` — operational commands wrapping `@gomission/mcp`
- `mission-executor` agent — dispatch surface for both `/mission run` and mobile "run on desktop" custom prompts routed via the secure relay
- Four skills backing prompt generation (`today-prompt`, `week-prompt`, `month-prompt`, `custom-run`)
- Optional Stop hook that appends session-close entries to the user's Mission daily-log
- Mission MCP server wired to the hosted read-only endpoint by default; users opt into local enforcement with `/mission install --local` or `--wrap`

## Why productivity?

The plugin's primary user surface is the today/week/month execution loop — it competes with task managers and daily planners, not with dev tools. The Trust Graduation gate underneath is what makes it safe to trust with real work.

## Install path once merged

```
/plugin marketplace add anthropics/claude-plugins-official
/plugin install mission
```

## Source

- Repo: https://github.com/gomission/plugin
- Tag: `v0.1.1` (commit `8118f1a`)
- Plugin subdir: `plugins/mission`
- MCP package: https://www.npmjs.com/package/@gomission/mcp
- Trust Graduation protocol: https://trustgraduation.org/

## Test plan

- [ ] `/plugin marketplace add anthropics/claude-plugins-official` picks up the new entry
- [ ] `/plugin install mission` installs cleanly and registers the `gomission` MCP server
- [ ] `/mission` command lists as available; `/mission doctor` returns a green result against the read-only remote
- [ ] `/mission install --local` writes the local Mission MCP entry to user config and `/mission run` becomes available after restart
- [ ] Uninstall path: `/plugin uninstall mission` removes the plugin and its MCP entry

---

## 4. Notes for future maintainers

- **Bump both `ref` and `sha`** on every release. `ref` is human-readable (`v0.2.0`), `sha` is verification.
- **Category `productivity`** is deliberate — Mission's user-facing surface competes with planners. The MCP/security angle is under the surface. Do not recategorize to `security` unless the marketplace splits `productivity` further.
- **Description length** is capped by marketplace convention around ~500 chars. The current draft is ~470. Keep any edits under the ceiling.
- **Never submit an unreleased sha.** Use tagged commits only.
