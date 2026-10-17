---
name: standard-slsa
description: "Verify a scoped SLSA supply-chain claim with evidence."
---
# SLSA

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active sentences, direct verbs and familiar, concrete words. Use ISO 704-inspired stable terms for distinct concepts.
- Use Diátaxis to separate tutorial, how-to, reference and explanation when useful. Do not force sections into short replies.
- Lead with the answer, result or next action. Omit routine Summary headings. Use TL;DR only when helpful for complex material, first, without a closing recap. Preserve requested detail and format.
- Preserve actors, facts, negation, conditions, exceptions, permissions, requirement force, safety, source scope and evidence limits.
- These drivers do not establish formal conformance or transfer legal or organisational authority. Apply other domain standards only when the task requires them.

## Execution controls
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. Specify one actor, action and observable verification target.
- For critical or risky work, place warnings before hazards and hold points before critical or irreversible steps. Verify actual state before destructive or hazardous work.
- When failure is plausible, state the expected result, failure sign and recovery. Keep prerequisites and ordered steps clear; use WARNING and PAUSE/VERIFY labels when useful.
- Explain difficult mechanisms from simple foundations. Contrast noncompliant and compliant code or configuration when useful.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable. Report observed results, not assumed success.

## Task and boundary
- Assess selected SLSA 1.2 source or build requirements for a named artefact or process.
- Do not award a SLSA level from a signed checksum, an SBOM or a CI badge alone.
- Work only on the selected artefact or assessment. This routine does not authorise attacks, deployment, publication or policy changes.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Adopt conditionally. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the artefact digest, source revision, build service and claimant.
2. Select the SLSA track and level for the assessment. Source and build tracks are not interchangeable scores.
3. Read every applicable requirement from the pinned version. Map each requirement to evidence from the actual system.
4. Inspect provenance for subject identity, builder, inputs and build definition appropriate to the claim.
5. Verify signatures or attestations against the consumer's trusted identities and policy. A valid signature can belong to an untrusted builder.
6. Check the isolation, integrity and control boundaries that the selected level requires. Metadata alone is not enough.
7. Keep dependencies and unassessed upstream components visible. The claim does not automatically extend through the whole dependency graph.
8. When authorised and practical, test representative tampered or mismatched artefacts against the consumer verification path.
9. Distinguish integrity, provenance, reproducibility, vulnerability status and authorisation.
10. Report each requirement as supported, failed, unverified or not applicable. Give reasons. Unresolved required evidence prevents a level claim.

## Verify and recover
- **Worked check (illustrative, not executed):** A release ships a SHA-256 file and declares the highest SLSA level.
- **Expected:** Verify the claimed track requirements and reject the unsupported leap from digest to supply-chain assurance.
- **If blocked:** If builder identity or provenance cannot be bound to the exact artefact, stop the affected assessment or action. Record the missing prerequisite and request it from the responsible owner. Continue only independent, authorised work.
- Keep planned work, observed evidence and unknown results separate. Missing or stale evidence is not a pass.
- Do not remove requirements for a score or line budget. Record unresolved source or task conflicts.
- Use the smallest check that detects the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Make one correction pass and recheck affected evidence. If a required issue remains, report it; do not loop or claim completion.
- Return the scoped result, source edition, evidence, limits, unresolved requirements and next permitted action. Do not claim formal conformance or model-behaviour improvement from this routine.
