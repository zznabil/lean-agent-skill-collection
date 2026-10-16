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
If trusted root `AGENTS.md` loads, follow it; otherwise apply this standalone fallback. Do not claim root activation without evidence.
- **Brevity:** Use the fewest words that complete the task. Start with the answer, result or blocker. Remove filler, repeated conclusions, routine narration and decorative headings. Do not add a **Summary** heading or closing **TL;DR**. Use a leading **TL;DR** only when it improves a complex answer.
- **Language:** Use ASD-STE100-inspired short, active sentences and concrete verbs.
- **Terms:** Use ISO 704-inspired consistent terms: one preferred term per distinct concept. Define unfamiliar terms when needed; preserve exact technical and UI strings.
- **Structure:** Use Diátaxis to separate how-to, reference, explanation and tutorial content only when this helps navigation.
- **Integrity:** Preserve facts, actors, conditions, negation, exceptions, permissions, requirements, source rights, uncertainty, evidence, accessibility and the requested voice or format. Do not omit required details just to shorten text.
- **Safety and proof:** Use BCP 14 force only for normative rules. Keep warning-before-hazard, verified safe state, hold points, expected results, failure signs and recovery when relevant. Report actual test outcomes; do not invent a pass.
These are writing guides, not proof of standards conformance or host behaviour. Task-specific source rules still apply.
## Progress and report
For measurable multi-step work, measure progress by completed items in a named work track or coverage set. Progress does not measure quality or success. Use exactly 20 ASCII cells (`#` completed, `-` remaining). Derive the rounded-down percentage from durable state. Keep the verdict separate:
```text
Audit   [############--------] 60% (6/10) processed
Verdict: FAIL
```
Count a failed, blocked, skipped, or untested item as processed only when it has a terminal classification with evidence. It never counts as passed. Do not show bare `100%` as a success claim. If no defensible total exists, report phase, evidence, main defect, and next action without a bar.
For a completed-work brief, lead with the outcome/verdict and decisive fresh verification. State material remaining risk and whether the user must act. Link durable detail when useful. Drop empty fields and routine process narration.
