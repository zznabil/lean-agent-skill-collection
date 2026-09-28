---
name: writing
description: "Draft or edit instructions, UI text, errors, help, emails, documentation, reports, and other prose for purpose, evidence, clarity, audience, and task fit while preserving the requested voice."
---

# Writing

Choose **draft** or **edit**. For agent policies, workflows, checklists, or consequential procedures, read [INSTRUCTION-EDITING.md](INSTRUCTION-EDITING.md).

1. **Audience and purpose.** Identify the reader, task, desired result, evidence standard, and requested voice.
2. **Mode.** Use **Diátaxis** when structure helps: how-to for actions, reference for facts or syntax, explanation for mechanisms.
3. **Language.** Use **ASD-STE100-inspired** grammar discipline and CDC-style word choice: short active sentences, direct verbs, familiar words, and the main point first.
4. **Requirements.** Use **BCP 14** only for normative force. Important requirements MUST name the actor, one action, and observable verification evidence.
5. **Action and recovery.** Put prerequisites and warnings before constrained actions. Add PAUSE/VERIFY hold points before critical or irreversible steps. For plausible failure, state the expected result, failure sign, and recovery.
6. **Useful detail.** Remove throat-clearing, generic praise, request restatement, repetition, filler, decorative complexity, and unsupported certainty.
7. **Examples.** For difficult mechanisms, use a Feynman-style explanation. For code or configuration, use a noncompliant/compliant contrast when it clarifies the rule.
8. **Source verification.** Verify material facts, names, dates, calculations, quotations, citations, links, and safety-critical wording.

Return the finished text, not a narration of how it was drafted. Briefly flag only material unresolved claims, decisions, or verification limits.

`wait-what` governs the surrounding assistant response. It does not force Summary or TL;DR sections into the drafted artifact unless the user requests them.


## Agent-facing instructions

For skills, agent policies, prompts, workflows, checklists or handoffs, read [INSTRUCTION-EDITING.md](INSTRUCTION-EDITING.md). Treat the executing agent as the intended reader and the required action as the information need. Preserve the source's mandates, conditions, exceptions, links, resources and evidence; do not replace them with "use judgement" or "follow best practices".

Use the same purpose, terminology, source-verification and task-success discipline for people and agents. Use teach's segmentation and worked-example method where a difficult branch needs explanation. This does not require a quiz or loading teach and wait-what as additional routed skills.

**User-facing:**

- Apply the global outcome-first delivery overlay.
- State supported conclusions directly; avoid litotes and rhetorical hedging that obscure status or responsibility.
- Preserve genuine uncertainty, evidence scope and degree, logical negation, quotations, and requested artifact voice.
- Own actual agent errors without inventing blame; give the correction or next action within existing permissions.
- Match reply length and structure to the weight of the ask.
- Investigate enough internally to be right, but report only the useful outcome, fresh verification, material uncertainty, and remaining user action; do not replay routine tool calls or internal process.
- Simple turns stay short.
- For substantive chat, use **Summary** and **TL;DR** when required by the active user or host contract or when they improve navigation; each MUST add distinct value and MUST NOT repeat the same conclusion.
- Apply the root **lean communication kernel**: ASD-STE100-inspired syntax and CDC word choice; Diátaxis mode separation; BCP 14 normative words; NASA-style atomic verification. Do not reintroduce discarded default standards through local prose.
- For risky or failure-prone work, add ANSI Z535 warning precedence, WHO hold points, OSHA state verification, and FDA error recovery. Use Feynman/SEI CERT pattern contrast only when it improves understanding.
- Use truthful named 20-cell progress separate from verdict.
- Preserve machine and artifact formats.
- Be considerate, avoid surprise scope, and leave the result ready to use or resume.
