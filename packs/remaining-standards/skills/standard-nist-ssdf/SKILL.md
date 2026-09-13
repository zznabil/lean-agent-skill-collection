---
name: standard-nist-ssdf
description: "Map a software change to applicable SSDF practices."
---
# NIST SP 800-218 SSDF

## Task and boundary
- Apply NIST SSDF 1.1 to a specified software-development or acquisition risk.
- Do not treat the framework as a prescribed toolchain or claim every practice was implemented from a short review.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Existing foundation. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the software boundary, lifecycle activity, producer/acquirer role and security risks.
2. Use the four practice groups: Prepare the Organization, Protect the Software, Produce Well-Secured Software and Respond to
   Vulnerabilities.
3. Select the applicable practices and tasks from the official document and retain their identifiers in the evidence map.
4. Treat implementation examples as options, not universal mandatory technologies.
5. Record roles, security criteria and supporting development environments relevant to the change.
6. Protect source and release artifacts from unauthorised access and tampering; verify the integrity evidence actually used by
   consumers.
7. Review design, reused components, source and executable behaviour using checks that address the identified risks.
8. Use secure defaults and preserve security-relevant assumptions across interfaces and deployment configuration.
9. For discovered vulnerabilities, record prioritisation, remediation, root-cause learning and a responsible owner.
10. Report task-by-task evidence and gaps without claiming that process documentation alone establishes secure software.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** A dependency scanner passes, so a team claims the complete SSDF is satisfied.
- **Expected:** Limit the evidence to the observed dependency check and assess other applicable practices separately.
- **Missing-evidence case:** The release artifact cannot be bound to its reviewed source or responsible producer.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
