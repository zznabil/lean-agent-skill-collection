---
name: guidance-cisa-secure-by-design
description: "Make product security the maker's responsibility."
---
# CISA Secure by Design

## Task and boundary
- Review product choices that shift preventable security burdens onto customers.
- Do not treat a pledge, secure-default label or checklist completion as demonstrated product security.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
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

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** A new installation exposes an administrative interface with a shared default password.
- **Expected:** Treat secure initial access as a product responsibility rather than adding only a warning telling customers to
  harden it.
- **Missing-evidence case:** The real default configuration or upgrade path cannot be tested.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
