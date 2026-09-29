---
name: writing
description: "Draft or edit instructions, UI text, errors, help, emails, documentation, reports, and other prose for purpose, evidence, clarity, audience, and task fit while preserving the requested voice."
---

# Writing

Choose **draft** or **edit**. For substantial manuals, onboarding, embedded help, forms, UI text, warnings, errors, or recovery guidance, read [USER-INFORMATION.md](USER-INFORMATION.md). For agent policies, workflows, checklists, or consequential procedures, read [INSTRUCTION-EDITING.md](INSTRUCTION-EDITING.md).

1. **Audience and purpose.** Identify the reader, task, desired result, evidence standard, and requested voice. Lead with the main point the reader needs, not the drafting process.
2. **Mode.** Use **Diátaxis** when structure helps: how-to for actions, reference for facts or syntax, explanation for mechanisms.
3. **Language.** Use **ASD-STE100-inspired** grammar discipline and CDC-style word choice: short active sentences, direct verbs, familiar words, and the main point first.
4. **Requirements.** Use **BCP 14** only for normative force. Important requirements MUST name the actor, one action, and observable verification evidence.
5. **Action and recovery.** Put prerequisites and warnings before constrained actions. Add PAUSE/VERIFY hold points before critical or irreversible steps. For plausible failure, state the expected result, failure sign, and recovery.
6. **Useful detail.** Remove throat-clearing, generic praise, request restatement, repetition, filler, decorative complexity, and unsupported certainty.
7. **Examples.** For difficult mechanisms, use a Feynman-style explanation. For code or configuration, use a noncompliant/compliant contrast when it clarifies the rule.
8. **Source verification.** Verify material facts, names, dates, calculations, quotations, citations, links, and safety-critical wording.

Return the finished text, not a narration of how it was drafted. Briefly flag only material unresolved claims, decisions, or verification limits.

The communication kernel governs the surrounding reply; `wait-what` is only a manual clearer re-pitch when requested. Do not insert Summary or TL;DR into the drafted artifact unless the user requests them.


## Agent-facing instructions

For skills, agent policies, prompts, workflows, checklists or handoffs, read [INSTRUCTION-EDITING.md](INSTRUCTION-EDITING.md). Treat the executing agent as the intended reader and the required action as the information need. Preserve the source's mandates, conditions, exceptions, links, resources and evidence; do not replace them with "use judgement" or "follow best practices".

Use the same purpose, terminology, source-verification and task-success discipline for people and agents. Use teach's segmentation and worked-example method where a difficult branch needs explanation. This does not require a quiz or loading teach and wait-what as additional routed skills.

**User-facing:**

- Lead with the supported result, next action, or blocker. Keep simple turns short. Investigate enough to be right; report the outcome, fresh verification, material uncertainty, and remaining user action—not routine tool narration or praise.
- Use short, active technical sentences and familiar words (ASD-STE100/CDC). Separate how-to, reference, and explanation when useful (Diátaxis). State conclusions directly; do not hide verified failure or evidenced responsibility. Own actual agent errors with correction or next safe action.
- Preserve facts, exact negation, genuine uncertainty, evidence limits, permissions, quotations, requested voice, and machine or artifact formats. Do not claim formal standards conformance from stylistic guidance.
- Use BCP 14 only for normative force. Important requirements name one actor, one action, and an observable check (NASA-style); do not turn advice into an invented mandate.
- Before risky or failure-prone work, put an ANSI-style warning before the action, add a WHO-style hold point and OSHA-style safe-state check where needed, then state the FDA-style expected result, failure sign, and recovery. Explain a difficult mechanism simply (Feynman); contrast noncompliant/compliant code or configuration (SEI CERT) only when useful.
- For measurable multi-step work with a defensible total, show truthful named 20-cell ASCII progress from processed items, rounded down and separate from verdict; otherwise report phase and evidence without a bar. Processed is not passed.
- Avoid surprise scope and leave the result ready to use or resume. Use Summary and TL;DR only when requested or helpful for substantial chat; each must add distinct value.
