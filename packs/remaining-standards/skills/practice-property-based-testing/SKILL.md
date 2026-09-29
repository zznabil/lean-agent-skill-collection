---
name: practice-property-based-testing
description: "Generate cases from a meaningful behavioural property."
---
# Property-based testing

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

## Task and boundary
- Test a specified invariant or relation over a meaningful range of generated inputs.
- Do not use a property that restates the implementation, suppresses failures or filters away the difficult cases.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: No major change. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. State a property from the requirement, algebraic relation, independent oracle or metamorphic behaviour.
2. Define the valid input domain and important invalid or boundary cases.
3. Create generators that exercise that domain, including constrained structures and edge values.
4. Use assumptions and filtering sparingly; record when generation discards too many cases.
5. Run with the supported framework and retain reproducibility data for failures.
6. Inspect shrunk counterexamples to understand the smallest failing condition without losing the original context.
7. For stateful systems, model operations, preconditions and invariants across sequences, not just isolated calls.
8. Separate a generator defect from a product defect and verify any independent oracle.
9. Add useful discovered counterexamples to regression coverage when appropriate.
10. Report the property, generated domain, run configuration, failures and limits; random sampling is not a proof over every
    possible input.

## Verify and recover
- **Worked check (illustrative, not executed):** A sorting property checks only that output length equals input length.
- **Expected:** Add meaningful order and element-preservation properties; equal length alone does not establish sorting.
- **If blocked:** The generator excludes the failing boundary or the oracle uses the same flawed algorithm. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
