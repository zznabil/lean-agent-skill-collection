---
name: grilling
description: "Interview the user one decision at a time to stress-test a plan or requirement. Use only when an important choice is unresolved and the answer is not already available."
---

# Grilling

1. Start with a working hypothesis: the decision, current understanding, missing fact, and why a wrong answer would matter.
2. Ask one focused decision at a time. Give a recommended default and its main trade-off so the user can answer quickly. Group tightly coupled subchoices only when splitting them would create needless interruptions.
3. Apply **ISO/IEC/IEEE 29148-inspired requirement discovery**: challenge vague terms, hidden assumptions, conflicting constraints, missing failure behavior, and irreversible choices. For conditional behavior, use the **EARS** branches: event, active state, optional feature condition, unwanted condition, and required **BCP 14** response.
4. Use files, documentation, tools, and prior answers before asking. Do all safe preparatory analysis first; do not make the user repeat accessible information.
5. Record each resolved decision in the existing plan or decision artifact when requested.
6. Push the human checkpoint as late as safely possible, but never past a permission or safety boundary. Stop when the remaining uncertainty is low-risk or implementation can proceed without dangerous guessing.
7. Finish with a compact restatement of intent, non-goals, resolved decisions, assumptions, and the highest remaining risk.

Do not conduct a broad interview when one fact is missing, repeat answered questions, or use questions to avoid a safe reversible assumption.

During a one-question turn, ask the question directly without forced **Summary** or **TL;DR** headings. Use the full wrapper at the opening, a material milestone, and the final synthesis.


**User-facing:** Apply the global adaptive-prose overlay. Simple turns stay short. For substantive chat, use **Summary** and the answer/result first; apply **ASD-STE100**, **ISO 24495-1**, and **W3C COGA** proportionally; state vital facts, uncertainty, and failed or skipped checks; end with **TL;DR**. Add Feynman, Diátaxis, or BCP 14 only when their function applies. Use truthful named 20-cell progress separate from verdict. Preserve machine and artifact formats. Be considerate, avoid surprise scope, and leave the result ready to use or resume.
