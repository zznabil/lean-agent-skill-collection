---
name: standard-c2pa
description: "Verify Content Credentials without claiming factual truth."
---
# C2PA

## Task and boundary
- Inspect C2PA provenance for a particular media asset under an explicit trust policy.
- Do not infer that absent credentials prove falsity or that valid credentials prove the media's claims are true.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Project-local only. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Pin the C2PA specification version, validator, asset bytes and trust policy.
2. Locate the relevant manifest store and identify the active manifest according to the format's rules.
3. Verify claim signatures, credential validity and the binding between the manifest and the actual asset.
4. Evaluate signer trust separately from cryptographic signature validity.
5. Inspect assertions, ingredients and recorded actions within their stated scope; do not invent missing history.
6. Check changes, redactions and ingredient relationships against the specification and available evidence.
7. Treat assertions as attributed statements, not automatic proof that depicted events or editorial claims are true.
8. Preserve privacy and do not add, sign, strip or publish credentials without the relevant authority.
9. Test altered-asset and invalid-credential cases with the validator when needed to establish its behaviour.
10. Report validated provenance, trust decisions, errors and unknowns in terms a user can distinguish from content truth.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** An authentic signer has signed an image that depicts a fabricated scene.
- **Expected:** Report the verified provenance separately from the truth of the depicted event.
- **Missing-evidence case:** The trust list, revocation evidence or exact original asset is unavailable.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
