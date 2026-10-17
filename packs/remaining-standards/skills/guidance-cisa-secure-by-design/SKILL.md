---
name: guidance-cisa-secure-by-design
description: "Make product security the maker's responsibility."
---
# CISA Secure by Design

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active sentences, direct verbs and familiar, concrete words. Use ISO 704-inspired stable terms for distinct concepts.
- Use Diátaxis to separate tutorial, how-to, reference and explanation when useful. Do not force sections into short replies.
- Lead with the answer, result or next action. Omit routine Summary headings. Use TL;DR only when helpful for complex material, first, without a closing recap. Preserve requested detail and format.
- Preserve actors, facts, negation, conditions, exceptions, permissions, requirement force, safety, source scope and evidence limits.
- These drivers do not establish formal conformance or transfer legal or organisational authority. Apply other domain standards only when the task requires them.

## Execution controls
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. Specify one actor, action and observable verification target.
- For critical or risky work, place warnings before hazards and hold points before critical or irreversible steps. Verify actual state before destructive or hazardous work.
- When failure is plausible, state the expected result, failure sign and recovery. Keep prerequisites and ordered steps clear; use WARNING and PAUSE/VERIFY labels when useful.
- Explain difficult mechanisms from simple foundations. Contrast noncompliant and compliant code or configuration when useful.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable. Report observed results, not assumed success.

## Task and boundary
- Review product choices that transfer preventable security burdens to customers.
- Do not treat a pledge, secure-default label or completed checklist as demonstrated product security.
- Work only on the selected artefact or assessment. This routine grants no permission to run attacks, deploy, publish or change policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) to identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot provide missing requirements or prove conformance.
- Historical adoption decision: Absorb. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the customer security outcome and how the product supports or obstructs it.
2. Apply the three themes: ownership of customer security outcomes, radical transparency/accountability, and leadership from the top.
3. Prioritise eliminating vulnerability classes. Do not prioritise transferring repeated detection and patching work to customers.
4. Review defaults. Check that customers do not need extensive specialist hardening just to obtain a defensible baseline.
5. Examine authentication, authorisation, update handling, logging and high-risk implementation choices in the actual product.
6. Use memory-safe designs or other systemic mitigations when the relevant vulnerability class and product context justify them.
7. Disclose security limits and known problems through appropriate channels. Do not expose sensitive information.
8. Assign product-side owners for required changes and measurable evidence of the customer outcome.
9. Verify actual defaults and supported upgrade/recovery paths. Documentation alone cannot establish the result.
10. Report findings and an improvement plan within the selected scope. Do not invent obligations beyond the selected project and guidance.

## Verify and recover
- **Worked check (illustrative, not executed):** A new installation exposes an administrative interface with a shared default password.
- **Expected:** Treat secure initial access as a product responsibility. Do not add only a warning that tells customers to harden it.
- **If blocked:** If you cannot test the real default configuration or upgrade path, stop the affected assessment or action. Record the missing prerequisite and request it from the responsible owner. Continue only independent, authorised work.
- Keep planned work, observed evidence and unknown results separate. Missing or stale evidence is not a pass.
- Do not remove requirements for a score or line budget. Record unresolved source or task conflicts.
- Use the smallest check that detects the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Make one correction pass and recheck affected evidence. If a required issue remains, report it; do not loop or claim completion.
- Return the scoped result, source edition, evidence, limits, unresolved requirements and next permitted action. Do not claim formal conformance or model-behaviour improvement from this routine.
