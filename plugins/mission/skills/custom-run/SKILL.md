---
name: custom-run
description: "Handle a custom-prompt run — the mobile 'run on desktop' path where the user typed a free-form instruction rather than running a generated tab prompt. Use when /mission:run is called with argument text, or when the mission-executor agent receives an intent of custom.agent."
---

# Custom Run

The user is directing the executor with their own words. Your job is to make that instruction executable through Mission without expanding scope.

## Steps

1. **Parse intent.** Read the raw text. Identify: the target entity (draft, thread, person, tracker row), the verb (draft, send, update, research, close), and the constraint (by when, using what evidence).
2. **Ground.** Look up the target in state. If it doesn't exist, refuse and name what's missing. Do not create the entity to make the run possible.
3. **Rewrite as a Mission payload.** One paragraph, same voice as Today. Turn the user's shorthand into an unambiguous action. Preserve their verbs — if they said "send," don't downgrade to "draft."
4. **Hand off.** Return the rewritten payload to the executor for the Trust Graduation ceremony (preview → approve → dispatch → receipt).

## Scope discipline

- Do not add "while I'm at it" work. If the user said "reply to Sarah," do not also update the tracker unless the reply flow requires it.
- Do not soften. If the user said "kill this draft," the payload says "kill this draft," not "consider whether to keep this draft."
- Do not expand to "and also send the follow-up." One request, one payload.

## Ambiguity

If the target is ambiguous (two people named Sarah, three drafts about the same topic), stop. Return one question that would resolve the ambiguity. Do not guess.

## Voice

The rewritten payload uses Ronen's voice rules. The user's original text may be sloppy; the payload is not.
