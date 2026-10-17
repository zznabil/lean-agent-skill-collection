---
name: practice-compliant-contrast
description: "Teach a rule through bad and compliant examples."
---
# Compliant contrast

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim activation without evidence.
- Use ASD-STE100-inspired short, active sentences and concrete words. Lead with the answer or action. Keep simple replies short.
- Use ISO 704-inspired stable terms. Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits.
- Use Diátaxis to separate information types when useful, not to force headings. Do not require an opening Summary or closing recap. Optional TL;DR belongs first.
- For normative requirements, use BCP 14 (RFC 2119/8174) MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. Name one actor, action and observable verification target.
- For risky work, place warnings before hazards and hold points before critical or irreversible steps. Verify actual state before destructive or hazardous work.
- When failure is plausible, give the expected result, failure sign and recovery. Explain difficult mechanisms from simple foundations; contrast code or configuration when useful.
- For critical procedures, include needed prerequisites, warnings, steps, verification, results and recovery without a fixed section template.
- Report observed results; missing or stale evidence is not success. Where applicable, show measurable multi-step progress with a truthful named 20-cell ASCII format.
- These practices imply neither formal conformance nor ANSI, WHO, OSHA, FDA or NASA authority. Apply other domain standards only when the task requires them.

## Purpose and boundary
Use this routine when contrasting cases helps the reader apply a rule. Keep the rule independent of examples. Removing one anti-pattern does not prove full compliance. Do not call generic agent work “CERT compliant”. Use SEI CERT contrast techniques for helpful code or configuration examples, not as a default communication driver.

## Rule object
Include only useful sections: `RULE` for one obligation or prohibition; `WHY` for the defect or risk; `NONCOMPLIANT` for a minimal violation; `COMPLIANT` for the smallest complete correction. Use `EXCEPTION` for a bounded, testable exception or `None identified`. Use `RELATED CHECKS` for residual conditions.

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
Verify that the compliant case satisfies the rule and the noncompliant case violates it for the stated reason. Stop if unstated assumptions decide the contrast. State them and revise both examples before use. Return the rule, cases, exceptions and residual checks.

For source details and access limits, see [SOURCES.md](SOURCES.md).
