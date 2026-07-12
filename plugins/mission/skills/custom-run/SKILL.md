---
name: custom-run
description: "Convert a free-form user instruction into a Mission-executable intent. Used for /mission approve with a raw text intent, and for the mobile 'run on desktop' relay where the user typed a custom instruction rather than running a generated tab prompt."
---

# Custom Run

The user is directing the ceremony with their own words. Your job is to turn that into a payload the executor can classify and gate.

## Steps

1. **Parse intent.** Read the raw text. Identify:
   - Target entity (draft, loop, thread, person, tracker row)
   - Verb (draft, send, update, research, close, kill)
   - Constraint (by when, using what evidence)
2. **Ground.** Look up the target via `mcp__gomission__mission_search` and, if needed, `mcp__gomission__mission_fetch`. If the target does not exist, refuse and name what's missing. Do not create the entity to make the run possible.
3. **Rewrite as an intent.** One sentence in Ronen's voice. Preserve the user's verb strength. If they said "send," don't downgrade to "draft."
4. **Suggest the tool.** If the intent implies a specific tool (Gmail send, Slack post, tracker update), name it in the intent. This helps `mission_classify` return the right action class.
5. **Hand off.** Return the rewritten intent + suggested tool to the mission-executor agent, which will classify and walk the ceremony.

## Scope discipline

- Do not add "while I'm at it" work.
- Do not soften. If the user said "kill this draft," the payload says "kill this draft."
- Do not expand to "and also send the follow-up." One request, one payload.

## Ambiguity

If the target is ambiguous (two people named Sarah, three drafts about the same topic), stop. Return one question that resolves the ambiguity. Do not guess.

## Voice

The rewritten intent uses Ronen's voice rules — short, declarative, no em dashes, concrete names.

## Output

Return one JSON object:
```json
{
  "intent": "<one-sentence intent>",
  "tool_name": "<suggested tool, or null>",
  "recipient_hint": "<email/handle/account hint, or null>",
  "source_refs": ["<mission ref>", ...]
}
```
