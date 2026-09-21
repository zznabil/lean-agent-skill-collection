---
name: standard-owasp-asvs
description: "Verify selected application controls with ASVS 5.0."
---
# OWASP ASVS

## Task and boundary
- Design or verify application security against an explicitly selected ASVS 5.0.0 scope and level.
- Do not impose one verification level on every project or confuse ASVS with an automated scanner score.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Existing conditional benchmark. Keep this boundary unless an authorised decision explicitly changes
  it.

## Procedure
1. Identify application boundaries, threat assumptions, sensitive data, users and selected verification level.
2. Use the official 5.0.0 requirements and version-qualified identifiers in the assessment.
3. Build a requirement-to-evidence map covering the selected level and applicable application functions.
4. Justify not-applicable requirements from actual architecture; absence of evidence is not non-applicability.
5. Inspect security decisions, implementation and configuration, then test required controls at the real trust boundary.
6. Test authorization separately from authentication, including object and tenant boundaries where applicable.
7. Examine input handling, output encoding, sessions, cryptography, communications and data protection as the selected requirements
   demand.
8. Use authorised, bounded negative tests; never target systems outside the approved scope.
9. Record exact revisions, test context, findings and rechecks after remediation.
10. Report verified, failed, unrun and inapplicable requirements separately; do not claim an OWASP-issued certification or complete
    assurance from partial checks.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** A UI hides another tenant's record, but its API returns the record to an unauthorised caller.
- **Expected:** Record the server-side authorization failure; the hidden UI control is not adequate evidence.
- **Missing-evidence case:** Required authenticated test roles or the intended verification scope are missing.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
