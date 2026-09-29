---
name: practice-compliant-contrast
description: "Teach a rule through bad and compliant examples."
---
# Compliant contrast

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
Use when showing both sides makes a rule easier to apply. Keep the rule independent of its examples. Removing one shown anti-pattern does not prove complete compliance; do not call generic agent work “CERT compliant”.

## Rule object
Include only sections that serve the task: `RULE` (one obligation or prohibition), `WHY` (defect or risk), `NONCOMPLIANT` (minimal violation), `COMPLIANT` (smallest complete correction), `EXCEPTION` (bounded and testable, or `None identified`) and `RELATED CHECKS` (residual conditions).

## Steps
1. State the rule and its applicable context before either example.
2. Keep surrounding assumptions the same; change only the decisive mechanism.
3. Explain why the noncompliant case fails. Show how the compliant case works, not only its final appearance.
4. Bound exceptions by trigger, scope and evidence. Name residual checks the example cannot establish.
5. Verify copied code, commands and identifiers in their stated context.

## Worked distinction
**RULE:** The worker MUST inspect an operation result before consuming its output.

**NONCOMPLIANT:** Edit a file, observe no visible exception, then report success.

**COMPLIANT:** Edit the file, inspect the operation result, read the changed content, run the relevant check and report observed evidence.

**RELATED CHECKS:** A successful edit does not prove unrelated files were preserved.

## Verify and recover
Check that the compliant case satisfies the stated rule and the noncompliant case violates it for the stated reason. If unstated assumptions decide the contrast, stop; make them explicit and revise both examples before use. Return the rule, cases, exceptions and residual checks.

Source details and access limits: [SOURCES.md](SOURCES.md).
