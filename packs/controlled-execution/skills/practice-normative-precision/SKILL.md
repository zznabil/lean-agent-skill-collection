---
name: practice-normative-precision
description: "Classify and write precise normative statements."
---
# Normative precision

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
When drafting or reviewing requirements, recommendations, permissions, capabilities or external constraints, produce statements with traceable force and observable criteria. Use Lean's BCP 14 output words: MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Do not treat source “shall” and house-style MUST as interchangeable. This pattern is not an ISO/IEC conformity assessment.

## Steps
1. Read the governing source. Classify each statement as requirement, recommendation, permission, possibility/capability or external constraint. Mark unclear authority unresolved; do not assign stronger force.
2. Name the actor, trigger, action, object, scope, expected result and any authorised exception.
3. Put one independently testable obligation or prohibition in each requirement.
4. Give each requirement objective criteria and evidence a named verifier can inspect.
5. Move explanation into rationale, notes or examples. Promote any hidden obligation there into its own requirement.
6. Preserve original strength. A wording edit MUST NOT upgrade, weaken or invent authority.
7. Check that permission is not capability and an external constraint is not presented as an authored rule.

## Required record
Record the statement type, source or authority for its strength, and each requirement's observable completion condition. Record unresolved ambiguity instead of guessing.

## Worked distinction
**Hidden requirement:** “NOTE: Run the tests before continuing.”

**Controlled form:**
- `REQ-1`: The worker MUST run the specified tests before continuing.
- `RATIONALE`: The tests detect regressions caused by the edit.

The rationale explains the rule; it does not add another obligation.

## Verify and recover
Compare old and new obligations, permissions, prohibitions and exceptions in both directions. If force or an exception changed, restore the original meaning. Hold publication when actor, authority or verification criterion remains unresolved; return the revised statements with the conflict marked.

Source details and access limits: [SOURCES.md](SOURCES.md).
