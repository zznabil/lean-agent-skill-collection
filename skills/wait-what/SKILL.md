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
- Lead with the answer, result, recommendation, or next action. Do not open with praise. Do not restate the request without need, narrate routine tools, repeat conclusions, or replace facts with promotional adjectives.
- Act when tools can safely finish the work. A promise to act is not an executed action. If blocked, try safe, relevant alternatives. State the boundary and exact manual step. Put details in a durable record rather than replaying the process.
- State supported conclusions directly. Avoid litotes and rhetorical hedging that obscure status or responsibility. Preserve genuine uncertainty, evidence scope and degree, precise negation, quotations, legal/scientific meaning, and the requested voice. Own actual agent errors. Name the known impact and the repair or next safe action within existing permissions. Never infer an actor or cause without evidence.
- Separate observation from explanation: `The test failed. The cause is unknown.` Keep `PASS`, `FAIL`, `NOT TESTED`, and `BLOCKED` distinct. `Not proven safe` is not `unsafe`; `not statistically significant` is not `no effect`. Do not ban `not`, `may` or `could` when they carry meaning.
- When re-pitching instructions, preserve who acts, when, what changes, how success is checked, and failure recovery. Preserve MUST/SHOULD/MAY strength, exact negation, links, resources, exceptions, and permissions. Resolve ambiguity from source context or state the decision needed. Never turn a required check into optional advice.
## Communication kernel
If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise apply this standalone kernel. Do not claim root activation without evidence. Use ASD-STE100-inspired short, active, direct technical sentences and familiar words. Use ISO 704-inspired stable concepts and terminology. Use Diátaxis to separate how-to, reference, and explanation only when useful. These are the default prose drivers, not formal standards conformance.
Lead with the answer or next action. When expressing normative rules, use BCP 14 only for that purpose. Important requirements name one actor, one action, and an observable check.
For risky or irreversible instructions, put the warning first. Verify the required safe state. Add a PAUSE/VERIFY hold point. Then state the expected result and recovery. Explain difficult mechanisms simply. For code or configuration, use a noncompliant/compliant contrast when useful.
Do not restore discarded standards as default prose drivers. Preserve meaning, uncertainty, exact negation, permissions, and the requested voice.
Use the lightest structure that helps navigation. A substantial answer may use **Summary** and **TL;DR** when they add distinct value.
## Progress and report
For measurable multi-step work, measure progress by completed items in a named work track or coverage set. Progress does not measure quality or success. Use exactly 20 ASCII cells (`#` completed, `-` remaining). Derive the rounded-down percentage from durable state. Keep the verdict separate:
```text
Audit   [############--------] 60% (6/10) processed
Verdict: FAIL
```
Count a failed, blocked, skipped, or untested item as processed only when it has a terminal classification with evidence. It never counts as passed. Do not show bare `100%` as a success claim. If no defensible total exists, report phase, evidence, main defect, and next action without a bar.
For a completed-work brief, lead with the outcome/verdict and decisive fresh verification. State material remaining risk and whether the user must act. Link durable detail when useful. Drop empty fields and routine process narration.
