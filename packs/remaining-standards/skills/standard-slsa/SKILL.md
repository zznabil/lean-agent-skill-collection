---
name: standard-slsa
description: "Verify a scoped SLSA supply-chain claim with evidence."
---
# SLSA

## Task and boundary
- Assess selected SLSA 1.2 source or build requirements for a named artifact or process.
- Do not award a SLSA level from a signed checksum, an SBOM or a CI badge alone.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Adopt conditionally. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the artifact digest, source revision, build service and claimant.
2. Select the SLSA track and level being assessed; source and build tracks are not interchangeable scores.
3. Read every applicable requirement from the pinned version and map it to evidence from the actual system.
4. Inspect provenance for subject identity, builder, inputs and build definition appropriate to the claim.
5. Verify signatures or attestations against the consumer's trusted identities and policy; a valid signature can belong to an
   untrusted builder.
6. Check the isolation, integrity and control boundaries required by the selected level, not merely the presence of metadata.
7. Keep dependencies and unassessed upstream components visible; the claim does not automatically extend through the whole
   dependency graph.
8. Test representative tampered or mismatched artifacts against the consumer verification path when authorised and practical.
9. Distinguish integrity, provenance, reproducibility, vulnerability status and authorisation.
10. Report each requirement as supported, failed, unverified or not applicable with reasons; unresolved required evidence prevents a
    level claim.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** A release ships a SHA-256 file and declares the highest SLSA level.
- **Expected:** Verify the claimed track requirements and reject the unsupported leap from digest to supply-chain assurance.
- **Missing-evidence case:** Builder identity or provenance cannot be bound to the exact artifact.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
