---
name: standard-nist-ai-ssdf
description: "Apply the AI SSDF profile with its base framework."
---
# NIST SP 800-218A

## Task and boundary
- Review secure development of generative AI or dual-use foundation-model systems using SP 800-218A.
- Do not use this AI profile as a replacement for SSDF 1.1 or as proof of complete AI trustworthiness.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Conditional benchmark. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify whether the task concerns a model producer, system producer or acquirer, and define the AI-system boundary.
2. Read SP 800-218A with SP 800-218; map the profile's additions and considerations to the base practices.
3. Identify model, data, code, infrastructure and third-party components that influence the security outcome.
4. Record provenance, allowed use, access control and integrity of training, tuning and evaluation inputs where relevant.
5. Protect model artifacts and development environments from unauthorised modification or disclosure.
6. Review model acquisition and integration assumptions instead of assuming an upstream model is safe because it is popular.
7. Evaluate the applicable AI-specific threats and failure modes using representative, authorised tests.
8. Record secure deployment, monitoring, vulnerability-response and update responsibilities throughout the selected lifecycle.
9. Retain evidence for the exact model/data/configuration revisions; a material change can invalidate earlier results.
10. Report the profile requirements assessed, base-framework dependencies and gaps; do not convert this review into a
    model-performance endorsement.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** An AI release passes application tests, but the deployed model hash differs from the evaluated model.
- **Expected:** Flag the integrity/evidence mismatch and re-establish the evaluated artifact before claiming readiness.
- **Missing-evidence case:** The model or training/tuning data provenance cannot be established.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
