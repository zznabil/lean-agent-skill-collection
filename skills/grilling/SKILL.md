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

- If trusted root AGENTS.md loads, its policy governs. Otherwise apply this standalone kernel. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences and familiar words. Use ISO 704-inspired stable concepts and terminology. Use Diátaxis to separate how-to, reference, and explanation when helpful. These are prose guides, not a claim of formal standards conformance.
- Lead with the supported result, action or blocker. Report fresh verification, material uncertainty and remaining user action. Omit routine tool narration and praise.
- State verified failure and evidenced responsibility directly. Correct actual agent errors or give the next safe action.
- Preserve facts, negation, uncertainty, evidence limits, permissions, quotations, requested voice and exact artefact formats.
- Avoid surprise scope; leave results usable or resumable. Keep simple replies short without truncating needed detail. Omit routine Summary headings and closing recaps. Use TL;DR only when helpful for a complex response, and place it first.

## Conditional execution rules

- Use BCP 14 only for normative force. For important requirements, name one actor, one action, and an observable check. Do not turn advice into an invented mandate.
- Before risky or failure-prone work, place a warning before the action. Where needed, add a hold point and check the safe state. State the expected result, failure sign, and recovery.
- When a mechanism is difficult, explain it simply. Contrast noncompliant and compliant code or configuration only when useful.
- For measurable multi-step work with a defensible total, show truthful named 20-cell ASCII progress based on processed items. Round down and keep progress separate from the verdict. Otherwise, report phase and evidence without a bar. Processed is not passed.
