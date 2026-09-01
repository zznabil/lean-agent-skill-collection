# Hermes Agent prompt and behavior review — V8.6.0

## Decision

**SELECTIVELY ABSORB THE PORTABLE BEHAVIOR. DO NOT VENDOR THE HERMES RUNTIME.**

Source reviewed: `NousResearch/hermes-agent` at commit `18a76be124d7c16ed98b629a358b23fef76a7f46`.

V8.6.0 adopts outcome-first reporting, response-weight matching, quiet completion, anti-filler, explicit uncertainty, evidence-based disagreement, execution after stated intent, and conditional batching of independent lookups. It does not copy Hermes profiles, memory, prompt caching, continuation hooks, computer-use drivers, tool schemas, or automatic skill mutation.

## Why the behavior works

Hermes separates several layers:

```text
SOUL.md
  identity and presentation behavior

Built-in system guidance
  task completion, tool use, anti-stall, execution discipline

Context posture
  coding brief, workspace facts, project instructions

Skills index
  compact discovery, then full SKILL.md only when selected

Tool contracts and runtime guards
  action semantics, effect verification, continuation, retries
```

The visible profile `SOUL.md` is therefore important but not sufficient to explain execution quality. Short final prose can coexist with deep internal inspection because the harness separately requires tool use, completion, and verification.

## Strongly absorbed

- Match response size and structure to the task.
- Lead with the result, answer, decision, or next action.
- For completed work, report outcome, fresh verification, and what remains.
- Do not replay routine tool calls or internal process.
- Remove generic praise, request restatement, duplicate conclusions, and promotional adjectives.
- State uncertainty and blockers directly.
- Correct an earlier answer when new evidence changes it.
- Agree because evidence supports the claim, not merely because the user proposed it.
- A promise to act must become tool execution or a blocker statement.
- Batch independent reads and checks when the host supports safe parallel calls.
- Keep detailed procedures in owning skills or tool guidance rather than duplicating them globally.
- Preserve deep investigation even when the user-facing reply is short.

## Selectively absorbed

- Host- or user-specific presentation preferences may replace the default Summary/TL;DR wrapper, but not truth, evidence, blockers, or necessary meaning.
- A compact completed-work brief can point to durable evidence rather than repeat it.
- Progressive disclosure remains the preferred skill model.

## Rejected

- Copying the complete Hermes system prompt.
- Bundling its runtime, memory, profile, caching, continuation, computer-use, or skill-mutation code.
- Claiming that a static Lean skill reproduces runtime enforcement.
- Globally loading every skill body into every prompt.
- Treating ultra-short output as permission to under-investigate.
- Making parallel tool calls mandatory on hosts that cannot prove them.
- Adding a routed `hermes-style` or `quiet-agent` skill.

## Interaction with Lean

Lean already had proportional rigor, considerate agency, proof integrity, cognitive accessibility, and explicit completion states. V8.6.0 changes the delivery surface:

```text
internal work
  enough evidence to justify the claim

external reply
  smallest useful result that preserves meaning,
  verification, uncertainty, blockers, and action
```

The 23-skill inventory and six profiles remain unchanged.

## Evaluation

The 48-case corpus covers micro-turns, simple facts, completed actions, blocked actions, corrections, uncertainty, teaching, consequential decisions, user/host wrapper overrides, tool-intent closure, conditional parallel lookup, and durable-audit compression.

Static policy checks do not prove live behavior in Hermes, OMP, Codex, or ChatGPT. A live A/B should compare task completion, fresh verification, unnecessary questions, process narration, duplicated conclusions, omitted material conditions, false success claims, and final reply size.
