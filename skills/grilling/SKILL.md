---
name: grilling
description: "Interview the user one decision at a time to stress-test a plan or requirement. Use only when an important choice is unresolved and the answer is not already available."
---

# Grilling

1. **Missing decision.** Start with a working hypothesis. State the decision, current understanding, missing fact, and why a wrong answer would matter.
2. **Decision-ready question.** Ask about one focused decision at a time. Give a recommended default and its main trade-off so the user can answer quickly. Group tightly coupled subchoices only when separate questions would cause needless interruptions.
3. **Requirement branches.** For requirement discovery, apply **ISO/IEC/IEEE 29148-inspired requirement discovery**. Challenge vague terms, hidden assumptions, conflicting constraints, missing failure behavior, and irreversible choices. For conditional behavior, use the **EARS** branches: event, active state, optional feature condition, unwanted condition, and required **BCP 14** response.
4. **Inspect before asking.** Check files, documentation, tools, and prior answers before you ask. Complete all safe preparatory analysis first. Do not ask the user to repeat accessible information.
5. **Decision record.** When requested, record each resolved decision in the existing plan or decision artifact.
6. **Permission boundary.** Delay the human checkpoint as far as safety permits. Never move it past a permission or safety boundary. Stop when the remaining uncertainty is low-risk or implementation can proceed without dangerous guessing.
7. **Resolved intent.** Finish with a compact restatement of intent, non-goals, resolved decisions, assumptions, and the highest remaining risk.

Do not conduct a broad interview when one fact is missing. Do not repeat answered questions or use questions to avoid a safe reversible assumption.
During a one-question turn, ask directly. Do not force **Summary** or **TL;DR** headings. At a material milestone or final synthesis, add navigational headings only when they help. Give each heading distinct content.

## Communication kernel
If trusted root `AGENTS.md` loads, follow it; otherwise apply this standalone fallback. Do not claim root activation without evidence.
- **Brevity:** Use the fewest words that complete the task. Start with the answer, result or blocker. Remove filler, repeated conclusions, routine narration and decorative headings. Do not add a **Summary** heading or closing **TL;DR**. Use a leading **TL;DR** only when it improves a complex answer.
- **Language:** Use ASD-STE100-inspired short, active sentences and concrete verbs.
- **Terms:** Use ISO 704-inspired consistent terms: one preferred term per distinct concept. Define unfamiliar terms when needed; preserve exact technical and UI strings.
- **Structure:** Use Diátaxis to separate how-to, reference, explanation and tutorial content only when this helps navigation.
- **Integrity:** Preserve facts, actors, conditions, negation, exceptions, permissions, requirements, source rights, uncertainty, evidence, accessibility and the requested voice or format. Do not omit required details just to shorten text.
- **Safety and proof:** Use BCP 14 force only for normative rules. Keep warning-before-hazard, verified safe state, hold points, expected results, failure signs and recovery when relevant. Report actual test outcomes; do not invent a pass.
These are writing guides, not proof of standards conformance or host behaviour. Task-specific source rules still apply.
## Conditional execution rules

- Use BCP 14 only for normative force. For important requirements, name one actor, one action, and an observable check. Do not turn advice into an invented mandate.
- Before risky or failure-prone work, place a warning before the action. Where needed, add a hold point and check the safe state. State the expected result, failure sign, and recovery.
- When a mechanism is difficult, explain it simply. Contrast noncompliant and compliant code or configuration only when useful.
- Give progress only when requested or useful. Keep progress distinct from the verdict.
