---
name: practice-compliant-contrast
description: "Teach a rule through bad and compliant examples."
---
# Compliant contrast

## Communication kernel
If trusted root `AGENTS.md` loads, follow it; otherwise apply this standalone fallback. Do not claim root activation without evidence.
- **Brevity:** Use the fewest words that complete the task. Start with the answer, result or blocker. Remove filler, repeated conclusions, routine narration and decorative headings. Do not add a **Summary** heading or closing **TL;DR**. Use a leading **TL;DR** only when it improves a complex answer.
- **Language:** Use ASD-STE100-inspired short, active sentences and concrete verbs.
- **Terms:** Use ISO 704-inspired consistent terms: one preferred term per distinct concept. Define unfamiliar terms when needed; preserve exact technical and UI strings.
- **Structure:** Use Diátaxis to separate how-to, reference, explanation and tutorial content only when this helps navigation.
- **Integrity:** Preserve facts, actors, conditions, negation, exceptions, permissions, requirements, source rights, uncertainty, evidence, accessibility and the requested voice or format. Do not omit required details just to shorten text.
- **Safety and proof:** Use BCP 14 force only for normative rules. Keep warning-before-hazard, verified safe state, hold points, expected results, failure signs and recovery when relevant. Report actual test outcomes; do not invent a pass.
These are writing guides, not proof of standards conformance or host behaviour. Task-specific source rules still apply.
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
