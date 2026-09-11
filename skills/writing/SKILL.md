---
name: writing
description: "Draft or edit instructions, UI text, errors, help, emails, documentation, reports, and other prose for purpose, evidence, clarity, audience, and task fit while preserving the requested voice."
---

# Writing

Choose **draft** or **edit**. For substantial instructions, manuals, onboarding, embedded help, forms, UI text, warnings, errors, or recovery guidance, read [USER-INFORMATION.md](USER-INFORMATION.md).

1. **Audience and purpose.** Identify the intended audience, user goal, task and context, desired action, evidence standard, and voice. Do not write for an undefined “general user” when the outcome depends on ability, prior knowledge, environment, or risk.
2. **Information need.** Apply **IEC/IEEE 82079-1:2019** and **ISO/IEC/IEEE 26514:2022** proportionally: establish the information need, where it belongs in the user journey, its lifecycle, and how the user will find and use it.
3. **Document purpose.** Apply **Diátaxis** proportionally: choose the primary job—**learn/tutorial**, **do/how-to**, **look up/reference**, **understand/explanation**, or **decide/decision brief**—and structure around it.
4. **Action and recovery.** For procedural content, put prerequisites before action. Give one main action or tightly coupled group per step, the expected result when useful, likely recovery, and material consequences before commitment.
5. **Terminology.** Apply **ISO 704:2022** proportionally: use one preferred term per concept within a scope, define necessary terms once, and do not swap synonyms merely for variety.
6. **Useful detail.** Match length and structure to the audience's task. Put the strongest useful information early. Remove throat-clearing, generic praise, request restatement, repetition, filler, decorative complexity, promotional adjectives, and unsupported certainty.
7. **Concrete wording.** Apply **ISO 24495-1**, **ISO/IEC 23859:2023**, and **W3C COGA** according to the medium: common concrete words, short coherent blocks, meaningful headings, explicit actions, visible orientation, and low avoidable memory burden.
   - Use **ASD-STE100 Issue 9-inspired** wording for technical prose when it preserves the requested voice.
8. **Source verification.** Verify material facts, names, dates, calculations, quotations, citations, links, and safety-critical wording.
9. **Task-based review.** For consequential user information, apply an **ISO/IEC/IEEE 26513-inspired** independent review and test the actual task with intended users when practical.
   - CDC Clear Communication Index and PEMAT-style understandability/actionability checks MAY help diagnose defects, but readability or a checklist score alone is not acceptance evidence.

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
- Apply **ASD-STE100**, **ISO 24495-1**, and **W3C COGA** proportionally.
- Add Feynman, Diátaxis, or BCP 14 only when their function applies.
- Use truthful named 20-cell progress separate from verdict.
- Preserve machine and artifact formats.
- Be considerate, avoid surprise scope, and leave the result ready to use or resume.
