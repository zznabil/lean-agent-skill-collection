---
name: standard-slsa
description: "Verify a scoped SLSA supply-chain claim with evidence."
---
# SLSA

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root `AGENTS.md` is loaded, its policy governs this skill. Skill-specific rules refine the kernel. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences. Lead with the main point and familiar words. Keep simple replies short.
- Use ISO 704-inspired stable concepts and terminology. Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits.
- Use Diátaxis organization: separate how-to, reference and explanation when useful. For difficult mechanisms, explain simple foundations first. Contrast noncompliant and compliant code or configuration when useful.
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. State one actor, action and observable verification target per requirement.
- For critical or risky work, place warnings before hazards. Place hold points before critical or irreversible steps. Before destructive or hazardous work, verify actual state.
- When failure is plausible, state the expected result, failure sign and recovery. For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful. Add contrast or TL;DR only when helpful.
- Report observed results. Missing or stale evidence is not success. For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.
- These rules do not transfer legal or organisational authority from other frameworks. Use other domain standards only when the task requires them; they are not default communication drivers.

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
