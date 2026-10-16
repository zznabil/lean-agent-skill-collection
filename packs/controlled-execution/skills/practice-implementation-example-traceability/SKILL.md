---
name: practice-implementation-example-traceability
description: "Separate required tasks from implementation examples."
---
# Implementation-example traceability

## Communication kernel
If trusted root `AGENTS.md` loads, follow it; otherwise apply this standalone fallback. Do not claim root activation without evidence.
- **Brevity:** Use the fewest words that complete the task. Start with the answer, result or blocker. Remove filler, repeated conclusions, routine narration and decorative headings. Do not add a **Summary** heading or closing **TL;DR**. Use a leading **TL;DR** only when it improves a complex answer.
- **Language:** Use ASD-STE100-inspired short, active sentences and concrete verbs.
- **Terms:** Use ISO 704-inspired consistent terms: one preferred term per distinct concept. Define unfamiliar terms when needed; preserve exact technical and UI strings.
- **Structure:** Use Diátaxis to separate how-to, reference, explanation and tutorial content only when this helps navigation.
- **Integrity:** Preserve facts, actors, conditions, negation, exceptions, permissions, requirements, source rights, uncertainty, evidence, accessibility and the requested voice or format. Do not omit required details just to shorten text.
- **Safety and proof:** Use BCP 14 force only for normative rules. Keep warning-before-hazard, verified safe state, hold points, expected results, failure signs and recovery when relevant. Report actual test outcomes; do not invent a pass.
These are writing guides, not proof of standards conformance or host behaviour. Task-specific source rules still apply.
## Condition-triggered execution rules
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Preserve their force. State one actor, one action and an observable verification target.
- For critical or risky work only, place warnings before hazards. Place hold points before critical or irreversible steps. Before destructive or hazardous work, verify the actual state.
- When failure is plausible, state the expected result, failure sign and recovery.
- For difficult mechanisms, explain from simple foundations. When useful for code or configuration tasks, contrast noncompliant and compliant forms.
- For critical procedures, keep prerequisites, warnings, verified holds, actions, expected results and recovery; add headings only when useful.
- Give progress only when requested or useful. Keep progress distinct from the verdict.
- These execution rules do not transfer legal or organisational authority from ANSI, WHO, OSHA, FDA or NASA. Use other domain standards only when the task requires them. They are not default communication drivers.

## Purpose and boundary
Use this routine when a framework names practices and tasks but gives non-exclusive implementation examples. Separate the required outcome from a possible implementation. A notional example is not a universal MUST. This routine does not constitute complete SSDF adoption or a NIST conformity assessment.

## Traceability record
Record `PRACTICE`, `TASK`, `REQUIRED OUTCOME`, `NOTIONAL EXAMPLE`, `CHOSEN IMPLEMENTATION`, `WHY IT FITS`, `EVIDENCE`, `REFERENCES` and `VERSION / STATUS`.

## Steps
1. Identify the governing practice, selected task, source status and version. Distinguish final publications from drafts.
2. Extract the required outcome. Label source examples as notional unless the source explicitly requires them.
3. Choose an implementation that suits the system, risk and existing process. Retain alternatives that also meet the outcome.
4. Explain how the choice meets the outcome. Define evidence that verifies the implementation in operation.
5. Re-evaluate the mapping when the framework or system changes. Keep the prior version and evidence traceable.

## Worked distinction
**Framework task:** Protect source code from unauthorised change.

**Notional example:** Require protected branches and review.

**Chosen implementation:** A signed change pipeline with mandatory review and a different protected integration mechanism.

The chosen implementation can satisfy the task if evidence supports the required outcome. The example does not automatically restrict the permitted design to that example.

## Verify and recover
Trace every MUST to the task or local authority, not just to an example. If the source status or required outcome remains unresolved, hold the adoption claim. Record the missing decision. Return the practice-to-evidence map and justified alternatives.

For source details and access limits, see [SOURCES.md](SOURCES.md).
