---
name: guard-postel-principle
description: "Reject undocumented permissive parsing as a default."
---
# Postel-style permissive parsing

## Task and boundary
- Review a proposed use of Postel-style tolerance at a protocol or trust boundary.
- Do not override a protocol's explicitly defined extension tolerance with a blanket reject-unknown rule.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.
- OFF-DEFAULT GUARD: use only for the stated selection or review request; do not install as an always-on workflow.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Reject as general boundary rule. Keep this boundary unless an authorised decision explicitly changes
  it.

## Procedure
1. Read the register decision: permissive parsing is rejected as a general boundary policy.
2. Identify the authoritative input contract, supported extensions and actual compatibility requirement.
3. Distinguish valid extensibility from malformed, contradictory or ambiguous input.
4. Consider how accepting invalid input affects interoperability, security and future protocol evolution.
5. Prefer active specification and implementation maintenance over undocumented parser accommodation.
6. If an exception is necessary, describe exactly what is accepted, why, its owner and when it can be removed.
7. Test sender/receiver behaviour across relevant implementations and malformed cases.
8. Preserve specified unknown-field handling, such as ignoring defined extension members, when the protocol requires it.
9. Keep diagnostic data bounded and free of sensitive payloads.
10. Report the explicit boundary policy and unresolved ambiguity; this guard does not silently change a parser or the register.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** A Problem Details consumer rejects every extension member in the name of strict parsing.
- **Expected:** Preserve RFC 9457's extension handling; the register rejects undocumented tolerance, not valid extensibility.
- **Missing-evidence case:** No authoritative contract or evidence justifies the proposed compatibility exception.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
