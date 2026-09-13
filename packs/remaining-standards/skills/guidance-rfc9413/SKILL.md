---
name: guidance-rfc9413
description: "Maintain protocol clarity instead of hidden tolerance."
---
# RFC 9413 protocol robustness

## Task and boundary
- Review a parser or protocol change where tolerance, ambiguity or interoperability affects maintenance.
- Do not interpret this guidance as a universal instruction to reject every extension field.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Absorb. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the actual protocol specification, extension points, implementations and interoperability evidence.
2. Distinguish permitted extensibility from undocumented acceptance of malformed or ambiguous inputs.
3. Find tolerance that hides sender defects, creates divergent interpretations or makes future changes harder.
4. Prefer correcting the specification or sender when that resolves the problem rather than accumulating invisible parser
   exceptions.
5. Define explicit handling for malformed, unknown and future-version input using the actual protocol rules.
6. Preserve required unknown-field tolerance where the protocol defines it; generic strictness must not override the contract.
7. Where compatibility requires a temporary exception, document the exact case, reason, owner and retirement condition.
8. Test independent implementations and relevant negative cases; happy-path parsing alone does not prove interoperability.
9. Collect only necessary diagnostic evidence and avoid logging sensitive input.
10. Report the long-term maintenance trade-off and remaining ambiguity. RFC 9413 is IAB guidance, not an Internet Standards Track
    protocol.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** A parser silently accepts two contradictory spellings of a field without a documented compatibility need.
- **Expected:** Identify the ambiguity and define explicit compatibility or rejection behaviour from the maintained contract.
- **Missing-evidence case:** The protocol owner or normative rule for unknown fields is unavailable.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
