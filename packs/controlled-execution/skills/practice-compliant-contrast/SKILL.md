---
name: practice-compliant-contrast
description: "Teach a rule through bad and compliant examples."
---
# Compliant contrast

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root `AGENTS.md` is loaded, its policy governs this skill. Skill-specific rules refine the kernel. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active, direct technical sentences. Lead with the main point. Use familiar words. Keep simple replies short.
- Use ISO 704-inspired stable concepts and terminology. Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits.
- Use Diátaxis organization when helpful. Separate how-to, reference and explanation.
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Preserve requirement force. State one actor, action and observable verification target.
- For critical or risky work only, place warnings before hazards. Put hold points before critical or irreversible steps.
- Before destructive or hazardous work, verify the actual state. When failure is plausible, state the expected result, failure sign and recovery action.
- When a mechanism is difficult, explain it from simple foundations. When useful, contrast noncompliant and compliant code or configuration.
- For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful. Add contrast or TL;DR only when helpful.
- Report observed results. Missing or stale evidence is not success. For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.
- These execution rules do not transfer ANSI, WHO, OSHA, FDA or NASA legal or organisational authority. Use other domain standards only when the task requires them. They are not default communication drivers.

## Purpose and boundary
Use this routine when showing both sides helps the reader apply a rule. Keep the rule independent of its examples. Removing one shown anti-pattern does not prove complete compliance. Do not call generic agent work “CERT compliant”. Use SEI CERT contrast techniques when code or configuration examples help with the task, not as a default communication driver.

## Rule object
Include only sections that serve the task. Use `RULE` for one obligation or prohibition. Use `WHY` for the defect or risk. Use `NONCOMPLIANT` for a minimal violation. Use `COMPLIANT` for the smallest complete correction. Use `EXCEPTION` for a bounded, testable exception, or `None identified`. Use `RELATED CHECKS` for residual conditions.

## Steps
1. State the rule and the context where it applies before either example.
2. Keep the surrounding assumptions the same. Change only the decisive mechanism.
3. Explain why the noncompliant case fails. Show how the compliant case works, not just its final appearance.
4. Define each exception by its trigger, scope and evidence. Name the residual checks that the example cannot establish.
5. Verify copied code, commands and identifiers in their stated context.

## Worked distinction
**RULE:** The worker MUST inspect an operation result before consuming its output.

**NONCOMPLIANT:** Edit a file, observe no visible exception, then report success.

**COMPLIANT:** Edit the file, inspect the operation result, read the changed content, run the relevant check and report observed evidence.

**RELATED CHECKS:** A successful edit does not prove unrelated files were preserved.

## Verify and recover
Check that the compliant case satisfies the stated rule. Check that the noncompliant case violates it for the stated reason. If unstated assumptions decide the contrast, stop. State those assumptions explicitly and revise both examples before use. Return the rule, cases, exceptions and residual checks.

For source details and access limits, see [SOURCES.md](SOURCES.md).
