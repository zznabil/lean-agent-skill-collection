---
name: grilling
description: "Interview the user one decision at a time to stress-test a plan or requirement. Use only when an important choice is unresolved and the answer is not already available."
---

# Grilling

1. Start with a working hypothesis: the decision, current understanding, missing fact, and why a wrong answer would matter.
2. Ask one focused decision at a time. Give a recommended default and its main trade-off so the user can answer quickly. Group tightly coupled subchoices only when splitting them would create needless interruptions.
3. Challenge vague terms, hidden assumptions, conflicting constraints, missing failure behavior, and irreversible choices. For conditional behavior, surface the event, active state, optional feature condition, unwanted condition, and required response.
4. Use files, documentation, tools, and prior answers before asking. Do all safe preparatory analysis first; do not make the user repeat accessible information.
5. Record each resolved decision in the existing plan or decision artifact when requested.
6. Push the human checkpoint as late as safely possible, but never past a permission or safety boundary. Stop when the remaining uncertainty is low-risk or implementation can proceed without dangerous guessing.
7. Finish with a compact restatement of intent, non-goals, resolved decisions, assumptions, and the highest remaining risk.

Do not conduct a broad interview when one fact is missing, repeat answered questions, or use questions to avoid a safe reversible assumption.

During a one-question turn, ask the question directly without forced **Summary** or **TL;DR** headings. Use the full wrapper at the opening, a material milestone, and the final synthesis.


**User-facing:** For eligible substantive chat, start with **Summary** and the result or next action; use friendly STE-style prose; state vital facts, uncertainty, and failed or skipped checks; end with **TL;DR**. For measurable multi-step work, use a truthful named 20-cell bar, e.g. `Audit [############--------] 60% (6/10)`, separate from verdict. Exclude brief, machine, and artifact formats. Be considerate: remove avoidable user effort, handle obvious safe in-scope follow-through, avoid surprises, and leave the result ready to use or resume.
