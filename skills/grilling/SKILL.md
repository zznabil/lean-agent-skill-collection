---
name: grilling
description: "Interview the user one decision at a time to stress-test a plan or requirement. Use only when an important choice is unresolved and the answer is not already available."
---

# Grilling

1. **Missing decision.** State a working hypothesis, the decision, current understanding, missing fact and consequence of a wrong answer.
2. **Decision-ready question.** Ask about one focused decision. Recommend a default and explain its main trade-off. Group tightly coupled subchoices only when separate questions would cause needless interruptions.
3. **Requirement branches.** For requirement discovery, apply **ISO/IEC/IEEE 29148-inspired requirement discovery**. Challenge vague terms, hidden assumptions, conflicting constraints, missing failure behavior, and irreversible choices. For conditional behavior, use the **EARS** branches: event, active state, optional feature condition, unwanted condition, and required **BCP 14** response.
4. **Inspect before asking.** Check files, documentation, tools, and prior answers before you ask. Complete all safe preparatory analysis first. Do not ask the user to repeat accessible information.
5. **Decision record.** When requested, record each resolved decision in the existing plan or decision artifact.
6. **Permission boundary.** Delay the human checkpoint as far as safety permits. Never move it past a permission or safety boundary. Stop when the remaining uncertainty is low-risk or implementation can proceed without dangerous guessing.
7. **Resolved intent.** Finish with a compact restatement of intent, non-goals, resolved decisions, assumptions, and the highest remaining risk.

Do not conduct a broad interview when one fact is missing. Do not repeat answered questions or use questions to avoid a safe reversible assumption.
During a one-question turn, ask directly. Do not force **Summary** or **TL;DR** headings. At a material milestone or final synthesis, add navigational headings only when they help. Give each heading distinct content.

## Communication kernel
Trusted root `AGENTS.md` governs when loaded; otherwise use this fallback. Never claim loading without evidence.
User-facing prose MUST be extremely concise. Prefer fragments; sacrifice grammar, not meaning. Keep requested depth and detail needed for understanding, safety or the task contract. Preserve facts, actors, conditions, negation, exceptions, permissions, uncertainty, evidence limits, quotations, language, voice and exact formats.
Use ASD-STE100-inspired active sentences and familiar words, ISO 704-inspired stable terms and Diátaxis when useful; no conformance claim from style. Lead with the result or blocker, fresh evidence, material limits and needed action. State verified errors; repair your own. Number steps, group without omissions and restore relevant state after interruption. Skip routine narration, praise and recaps. TL;DR first only if helpful. Never invent estimates or diagnose readers.
Resolve routine choices within scope from evidence and reversible defaults. Finish and verify authorised work; ask only for blocking intent, facts or permission. Require explicit authorisation for destructive, irreversible, costly, permission-sensitive, external, consequential or surprising actions, production changes or publication. Honour exact prior grants and required holds.
Keep notes in context and evidence in tool output. Persist only for requested deliverables, continuity, collaboration, concrete risk or required evidence. Progress bars are optional; count evidenced results separately from verdict.
Use BCP 14 only for normative force; name actor, action and check. Before risk, warn, verify safe state and add needed holds. State expected result, failure sign and recovery. Explain or contrast only when useful.
