---
name: practice-implementation-example-traceability
description: "Separate required tasks from implementation examples."
---
# Implementation-example traceability

## Lean communication kernel fallback (standalone)
- If trusted root `AGENTS.md` is loaded, its policy governs this skill. Otherwise MUST apply this lean communication kernel fallback; skill-specific rules refine it.
- Lead with the main point and familiar words (CDC Clear Communication Index). Use short, active, direct technical sentences (ASD-STE100).
- Separate how-to, reference and explanation when useful (Diátaxis). Keep simple replies short.
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. Use NASA-style one actor, action and observable verification target.
- For critical or risky work only, put ANSI-style warnings before hazards and WHO-style hold points before critical or irreversible steps.
- Before destructive or hazardous work, verify actual state (OSHA-style). When failure is plausible, state expected result, failure sign and recovery (FDA human-factors style).
- Explain difficult mechanisms from simple foundations (Feynman). Contrast noncompliant and compliant code or configuration when useful (SEI CERT).
- For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful; add contrast or TL;DR only when helpful.
- Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits. Report observed results; missing or stale evidence is not success.
- These are communication/control patterns, not transferred ANSI, WHO, OSHA, FDA or NASA legal or organisational authority. Use other domain standards only when the task requires them.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.

## Purpose and boundary
Use when a framework names practices and tasks but offers non-exclusive implementation examples. Separate the required outcome from one possible implementation. A notional example is not a universal MUST. This routine is not complete SSDF adoption or NIST conformity assessment.

## Traceability record
Record `PRACTICE`, `TASK`, `REQUIRED OUTCOME`, `NOTIONAL EXAMPLE`, `CHOSEN IMPLEMENTATION`, `WHY IT FITS`, `EVIDENCE`, `REFERENCES` and `VERSION / STATUS`.

## Steps
1. Identify the governing practice, selected task, source status and version. Separate final publications from drafts.
2. Extract the required outcome. Label source examples notional unless the source explicitly requires them.
3. Choose an implementation suited to the system, risk and existing process. Retain alternatives that also meet the outcome.
4. Explain how the choice meets the outcome. Define evidence that verifies it in operation.
5. Re-evaluate the mapping when the framework or system changes; keep the prior version and evidence traceable.

## Worked distinction
**Framework task:** Protect source code from unauthorised change.

**Notional example:** Require protected branches and review.

**Chosen implementation:** A signed change pipeline with mandatory review and a different protected integration mechanism.

The chosen implementation can satisfy the task if evidence supports the required outcome. The example is not automatically the only permitted design.

## Verify and recover
Trace every MUST to the task or local authority, not merely to an example. If source status or required outcome is unresolved, hold the adoption claim and record the missing decision. Return the practice-to-evidence map and justified alternatives.

Source details and access limits: [SOURCES.md](SOURCES.md).
