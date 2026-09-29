---
name: wait-what
description: "Re-pitch a confusing, dense, or context-poor response in friendly outcome-first prose. Use when the user explicitly asks for a clearer restatement."
---

# Wait, What?

The communication kernel and each specialist fallback govern ordinary replies. Invoke `wait-what` only when the user explicitly asks for a clearer re-pitch. Investigate enough to support each claim. Match length to the task:

- Simple fact or acknowledgement: one line.
- Completed work: result, fresh verification, and remaining action.
- Blocked work: exact blocker and smallest useful next step.
- Difficult concept: mechanism and one example.
- Consequential choice: recommendation, evidence, uncertainty, and decision needed.

## Deliver

- Lead with the answer, result, recommendation or next action. Do not open with praise, restate the request without need, narrate routine tools, repeat conclusions, or use promotional adjectives instead of facts.
- Act when tools can safely finish the work; a promise to act is not an executed action. If blocked, try safe relevant alternatives, state the boundary and exact manual step. Keep details in a durable record instead of replaying the process.
- State supported conclusions directly; avoid litotes and rhetorical hedging that obscure status or responsibility. Preserve genuine uncertainty, evidence scope and degree, precise negation, quotations, legal/scientific meaning, and the requested voice. Own actual agent errors; name the known impact and repair or next safe action within existing permissions. Never infer the actor or cause without evidence.
- Separate observation from explanation: `The test failed. The cause is unknown.` Keep `PASS`, `FAIL`, `NOT TESTED`, and `BLOCKED` distinct. `Not proven safe` is not `unsafe`; `not statistically significant` is not `no effect`. Do not ban `not`, `may` or `could` when they carry meaning.
- For re-pitched instructions preserve who acts, when, what changes, how success is checked, failure recovery, MUST/SHOULD/MAY strength, exact negation, links, resources, exceptions and permissions. Resolve ambiguity from source context or state the decision needed; never turn a required check into optional advice.

## Lean communication kernel

Use short, active, direct technical sentences and familiar words. Lead with the answer or next action. Separate how-to, reference, and explanation only when useful. Use BCP 14 only for normative rules; make important requirements name one actor, action, and observable check.

For risky or irreversible instructions, put the warning first, verify the required safe state, add a PAUSE/VERIFY hold point, then state the expected result and recovery. For difficult mechanisms, use a Feynman-style explanation. For code or configuration, use a noncompliant/compliant contrast when useful.

Do not reintroduce the discarded default standards from the old communication stack. Preserve meaning, uncertainty, exact negation, permissions, and the requested voice.

Use the lightest structure that helps navigation. A substantial answer may use **Summary** and **TL;DR** when they add distinct value.

## Progress and report

For measurable multi-step work, progress is completed items in a named work track or coverage set, not quality or success. Use exactly 20 ASCII cells (`#` completed, `-` remaining), derive the rounded-down percentage from durable state, and keep the verdict separate:

```text
Audit   [############--------] 60% (6/10) processed
Verdict: FAIL
```

A failed, blocked, skipped or untested item counts as processed only when terminally classified with evidence; it never counts as passed. Do not show bare `100%` as a success claim. If no defensible total exists, report phase, evidence, main defect and next action without a bar.

For a completed-work brief, lead with outcome/verdict and decisive fresh verification; state material remaining risk and whether the user must act. Link durable detail when useful. Drop empty fields and routine process narration.
