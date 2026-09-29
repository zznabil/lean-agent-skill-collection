---
name: guidance-cisa-secure-by-design
description: "Make product security the maker's responsibility."
---
# CISA Secure by Design

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
- Review product choices that shift preventable security burdens onto customers.
- Do not treat a pledge, secure-default label or checklist completion as demonstrated product security.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Absorb. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the customer security outcome and how the product currently supports or obstructs it.
2. Apply the three themes: ownership of customer security outcomes, radical transparency/accountability, and leadership from the
   top.
3. Prioritise eliminating classes of vulnerabilities instead of transferring repeated detection and patching work to customers.
4. Review defaults so customers do not need extensive specialist hardening merely to obtain a defensible baseline.
5. Examine authentication, authorization, update handling, logging and high-risk implementation choices in the actual product.
6. Use memory-safe designs or other systemic mitigations when justified by the relevant vulnerability class and product context.
7. Make security limits and known problems visible through appropriate disclosure without exposing sensitive information.
8. Assign product-side owners for needed changes and measurable evidence of the customer outcome.
9. Verify actual defaults and supported upgrade/recovery paths; documentation alone cannot establish the result.
10. Report the scoped findings and improvement plan without inventing obligations beyond the selected project and guidance.

## Verify and recover
- **Worked check (illustrative, not executed):** A new installation exposes an administrative interface with a shared default password.
- **Expected:** Treat secure initial access as a product responsibility rather than adding only a warning telling customers to
  harden it.
- **If blocked:** The real default configuration or upgrade path cannot be tested. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
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
