---
name: standard-slsa
description: "Verify a scoped SLSA supply-chain claim with evidence."
---
# SLSA

## Communication kernel
If trusted root `AGENTS.md` loads, follow it; otherwise apply this standalone fallback. Do not claim root activation without evidence.
- **Brevity:** Use the fewest words that complete the task. Start with the answer, result or blocker. Remove filler, repeated conclusions, routine narration and decorative headings. Do not add a **Summary** heading or closing **TL;DR**. Use a leading **TL;DR** only when it improves a complex answer.
- **Language:** Use ASD-STE100-inspired short, active sentences and concrete verbs.
- **Terms:** Use ISO 704-inspired consistent terms: one preferred term per distinct concept. Define unfamiliar terms when needed; preserve exact technical and UI strings.
- **Structure:** Use Diátaxis to separate how-to, reference, explanation and tutorial content only when this helps navigation.
- **Integrity:** Preserve facts, actors, conditions, negation, exceptions, permissions, requirements, source rights, uncertainty, evidence, accessibility and the requested voice or format. Do not omit required details just to shorten text.
- **Safety and proof:** Use BCP 14 force only for normative rules. Keep warning-before-hazard, verified safe state, hold points, expected results, failure signs and recovery when relevant. Report actual test outcomes; do not invent a pass.
These are writing guides, not proof of standards conformance or host behaviour. Task-specific source rules still apply.
## Task and boundary
- Assess selected SLSA 1.2 source or build requirements for a named artifact or process.
- Do not award a SLSA level from a signed checksum, an SBOM or a CI badge alone.
- Work only on the selected artifact or assessment. This routine does not authorise attacks, deployment, publication or policy changes.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Adopt conditionally. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the artifact digest, source revision, build service and claimant.
2. Select the SLSA track and level for the assessment. Source and build tracks are not interchangeable scores.
3. Read every applicable requirement from the pinned version. Map each requirement to evidence from the actual system.
4. Inspect provenance for subject identity, builder, inputs and build definition appropriate to the claim.
5. Verify signatures or attestations against the consumer's trusted identities and policy. A valid signature can belong to an untrusted builder.
6. Check the isolation, integrity and control boundaries that the selected level requires. Metadata alone is not enough.
7. Keep dependencies and unassessed upstream components visible. The claim does not automatically extend through the whole dependency graph.
8. When authorised and practical, test representative tampered or mismatched artifacts against the consumer verification path.
9. Distinguish integrity, provenance, reproducibility, vulnerability status and authorisation.
10. Report each requirement as supported, failed, unverified or not applicable. Give reasons. Unresolved required evidence prevents a level claim.

## Verify and recover
- **Worked check (illustrative, not executed):** A release ships a SHA-256 file and declares the highest SLSA level.
- **Expected:** Verify the claimed track requirements and reject the unsupported leap from digest to supply-chain assurance.
- **If blocked:** If builder identity or provenance cannot be bound to the exact artifact, stop the affected assessment or action. Record the missing prerequisite and request it from the responsible owner. Continue only independent, authorised work.
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or meet the line budget. Record any unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck the affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
