---
name: writing
description: "Draft or edit instructions, UI text, errors, help, emails, documentation, reports, and other prose for purpose, evidence, clarity, audience, and task fit while preserving the requested voice."
---

# Writing

Choose **draft** or **edit**. For substantial instructions, manuals, onboarding, embedded help, forms, UI text, warnings, errors, or recovery guidance, read [USER-INFORMATION.md](USER-INFORMATION.md).

1. Identify the intended audience, user goal, task and context, desired action, evidence standard, and voice. Do not write for an undefined “general user” when the outcome depends on ability, prior knowledge, environment, or risk.
2. Apply **IEC/IEEE 82079-1:2019** and **ISO/IEC/IEEE 26514:2022** proportionally: establish the information need, where it belongs in the user journey, its lifecycle, and how the user will find and use it.
3. Apply **Diátaxis** proportionally: choose the primary job—**learn/tutorial**, **do/how-to**, **look up/reference**, **understand/explanation**, or **decide/decision brief**—and structure around it.
4. For procedural content, put prerequisites before action. Give one main action or tightly coupled group per step, the expected result when useful, likely recovery, and material consequences before commitment.
5. Apply **ISO 704:2022** proportionally: use one preferred term per concept within a scope, define necessary terms once, and do not swap synonyms merely for variety.
6. Put the strongest useful information early. Remove throat-clearing, repetition, filler, decorative complexity, and unsupported certainty.
7. Apply **ISO 24495-1**, **ISO/IEC 23859:2023**, and **W3C COGA** according to the medium: common concrete words, short coherent blocks, meaningful headings, explicit actions, visible orientation, and low avoidable memory burden. Use **ASD-STE100 Issue 9-inspired** wording for technical prose when it preserves the requested voice.
8. Verify material facts, names, dates, calculations, quotations, citations, links, and safety-critical wording.
9. For consequential user information, apply an **ISO/IEC/IEEE 26513-inspired** independent review and test the actual task with intended users when practical. CDC Clear Communication Index and PEMAT-style understandability/actionability checks MAY help diagnose defects, but readability or a checklist score alone is not acceptance evidence.

Return the finished text. Briefly flag only material unresolved claims or decisions.

`wait-what` governs the surrounding assistant response. It does not force Summary or TL;DR sections into the drafted artifact unless the user requests them.


**User-facing:** Apply the global adaptive-prose overlay. Simple turns stay short. For substantive chat, use **Summary** and the answer/result first; apply **ASD-STE100**, **ISO 24495-1**, and **W3C COGA** proportionally; state vital facts, uncertainty, and failed or skipped checks; end with **TL;DR**. Add Feynman, Diátaxis, or BCP 14 only when their function applies. Use truthful named 20-cell progress separate from verdict. Preserve machine and artifact formats. Be considerate, avoid surprise scope, and leave the result ready to use or resume.
