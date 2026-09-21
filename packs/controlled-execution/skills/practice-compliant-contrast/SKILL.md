---
name: practice-compliant-contrast
description: "Teach a rule through bad and compliant examples."
---
# Compliant contrast

## Use and boundary
- Use when an instruction is easier to apply after both sides of its boundary are visible.
- Keep the rule independent of the examples.
- Do not imply that removing one shown anti-pattern proves complete compliance.
- Do not label generic agent work “CERT compliant”.

## Rule object
Include only the sections that serve the task:
1. `RULE`: one normative obligation or prohibition.
2. `WHY`: the defect, risk or interoperability problem.
3. `NONCOMPLIANT`: a minimal example that violates the rule.
4. `COMPLIANT`: the smallest complete correction.
5. `EXCEPTION`: a narrow, testable exception, or `None identified`.
6. `RELATED CHECKS`: other conditions needed for the overall claim.

## Procedure
1. State the rule before either example.
2. Make both examples differ at the decisive point.
3. Preserve the same surrounding assumptions so the contrast is valid.
4. Explain why the noncompliant case fails; do not rely on visual labelling alone.
5. Show the compliant mechanism, not only a rewritten result.
6. Bound every exception by trigger, scope and evidence.
7. Identify residual checks that the example does not cover.
8. Verify that copied code, commands and identifiers remain executable in their stated context.

## Worked distinction
**RULE:** The worker MUST inspect an operation result before consuming its output.

**NONCOMPLIANT:** Edit a file, observe no visible exception, then report success.

**COMPLIANT:** Edit the file, inspect the operation result, read the changed content, run the relevant check and report observed evidence.

**RELATED CHECKS:** A successful edit does not prove that unrelated files were preserved.

## Finish and stop
- Confirm that the compliant example actually satisfies the stated rule.
- Stop if the examples need unstated assumptions to differ.
- Return the rule, both examples, exceptions and residual checks.

Source details and access limits: [SOURCES.md](SOURCES.md).
