---
name: guidance-cisa-secure-by-design
description: "Make product security the maker's responsibility."
---
# CISA Secure by Design

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root `AGENTS.md` is loaded, its policy governs this skill. Otherwise you MUST apply this kernel; skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences. Lead with the main point and familiar words. Keep simple replies short.
- Use ISO 704-inspired stable concepts and terminology. Keep each actor, action and observable verification target clear.
- Use Diátaxis organization to separate how-to, reference and explanation when useful. These three approaches are the default prose drivers, not formal standards conformance. Use other domain standards only when the task requires them.

## Execution safeguards
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Preserve requirement force.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Before destructive or hazardous work, verify actual state.
- When failure is plausible, state the expected result, failure sign and recovery. For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful. Add contrast or TL;DR only when helpful.
- When explaining difficult mechanisms, start with simple foundations. Contrast noncompliant and compliant code or configuration when useful.
- Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits. Report observed results. Missing or stale evidence is not success.
- These safeguards transfer no legal or organisational authority from ANSI, WHO, OSHA, FDA or NASA.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.

## Task and boundary
- Review product choices that transfer preventable security burdens to customers.
- Do not treat a pledge, secure-default label or completed checklist as demonstrated product security.
- Work only on the selected artifact or assessment. This routine grants no permission to run attacks, deploy, publish or change policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) to identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot provide missing requirements or prove conformance.
- Historical adoption decision: Absorb. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the customer security outcome. Determine how the product currently supports or obstructs that outcome.
2. Apply the three themes: ownership of customer security outcomes, radical transparency/accountability, and leadership from the top.
3. Prioritise eliminating vulnerability classes. Do not prioritise transferring repeated detection and patching work to customers.
4. Review defaults. Check that customers do not need extensive specialist hardening just to obtain a defensible baseline.
5. Examine authentication, authorization, update handling, logging and high-risk implementation choices in the actual product.
6. Use memory-safe designs or other systemic mitigations when the relevant vulnerability class and product context justify them.
7. Disclose security limits and known problems through appropriate channels. Do not expose sensitive information.
8. Assign product-side owners for required changes and measurable evidence of the customer outcome.
9. Verify actual defaults and supported upgrade/recovery paths. Documentation alone cannot establish the result.
10. Report findings and an improvement plan within the selected scope. Do not invent obligations beyond the selected project and guidance.

## Verify and recover
- **Worked check (illustrative, not executed):** A new installation exposes an administrative interface with a shared default password.
- **Expected:** Treat secure initial access as a product responsibility. Do not add only a warning that tells customers to harden it.
- **If blocked:** If you cannot test the real default configuration or upgrade path, stop the affected assessment or action. Record the missing prerequisite and request it from the responsible owner. Continue only independent, authorised work.
- Retain facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not remove requirements to improve a score or meet the line budget. Record any unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the result within the selected scope, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
