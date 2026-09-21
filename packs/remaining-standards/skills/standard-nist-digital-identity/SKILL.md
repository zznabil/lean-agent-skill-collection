---
name: standard-nist-digital-identity
description: "Select and verify identity assurance by actual risk."
---
# NIST SP 800-63-4 Digital Identity Guidelines

## Task and boundary
- Review a digital-identity flow using the selected NIST SP 800-63-4 assurance requirements.
- Do not infer identity proofing, authentication and federation assurance from one another or from an MFA checkbox.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Project-local benchmark. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the service, population, impacts of identity failures and project adoption of the guidance.
2. Perform the documented risk assessment and choose IAL, AAL and FAL as separate decisions where applicable.
3. Use 800-63A-4 for proofing/enrolment, 800-63B-4 for authentication/authenticator management, and 800-63C-4 for
   federation/assertions.
4. Map each selected requirement to implementation and test evidence; do not choose numeric thresholds from memory.
5. Review enrolment, binding, authentication, recovery, revocation, session handling and lifecycle transitions relevant to the flow.
6. Check phishing resistance, replay protection and verifier behaviour against the selected authenticator and assurance
   requirements.
7. Assess federation audience, issuer, assertion validation and trust relationships under the selected federation model.
8. Preserve privacy, usability and equity considerations without silently weakening assurance requirements.
9. Test real error, recovery and compromised-credential paths within approved accounts and environments.
10. Report the selected levels, rationale, actual evidence and unverified requirements; product marketing is not assurance evidence.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** An application uses MFA but has no evidence for its claimed identity-proofing level.
- **Expected:** Assess IAL separately; the MFA mechanism does not establish who was enrolled.
- **Missing-evidence case:** Required proofing records, authenticator configuration or federation trust evidence is unavailable.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
