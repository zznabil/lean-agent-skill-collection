---
name: practice-implementation-example-traceability
description: "Separate required tasks from implementation examples."
---
# Implementation-example traceability

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root `AGENTS.md` loads, its policy governs this skill. Otherwise, you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences. Lead with the main point and familiar words. Use ISO 704-inspired stable concepts and terminology. Use Diátaxis to separate how-to, reference and explanation when useful. Keep simple replies short. These are inspired practices, not formal standards conformance.
- Preserve actors, facts, negation, conditions, exceptions, permissions, requirement force, safety, source scope and evidence limits. Report observed results. Missing or stale evidence is not success.

## Condition-triggered execution rules
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Preserve their force. State one actor, one action and an observable verification target.
- For critical or risky work only, place warnings before hazards. Place hold points before critical or irreversible steps. Before destructive or hazardous work, verify the actual state.
- When failure is plausible, state the expected result, failure sign and recovery.
- For difficult mechanisms, explain from simple foundations. When useful for code or configuration tasks, contrast noncompliant and compliant forms.
- For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful. Add contrast or TL;DR only when helpful.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.
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
