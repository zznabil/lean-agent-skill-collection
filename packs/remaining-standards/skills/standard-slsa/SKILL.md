---
name: standard-slsa
description: "Verify a scoped SLSA supply-chain claim with evidence."
---
# SLSA

## Lean communication kernel fallback (standalone)
- If trusted root `AGENTS.md` is loaded, its policy governs this skill. Otherwise MUST apply this lean communication kernel fallback; skill-specific rules refine it.
- Lead with the main point and familiar words (CDC Clear Communication Index). Use short, active, direct technical sentences (ASD-STE100).
- Separate how-to, reference and explanation when useful (Diátaxis). Keep simple replies short.
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. Use NASA-style one actor, action and observable verification target.
- For critical or risky work only, put ANSI-style warnings before hazards and WHO-style hold points before critical or irreversible steps.
- Before destructive or hazardous work, verify actual state (OSHA-style). When failure is plausible, state expected result, failure sign and recovery (FDA human-factors style).
- Explain difficult mechanisms from simple foundations (Feynman). Contrast noncompliant and compliant code or configuration when useful (SEI CERT).
- For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful; add contrast or TL;DR only when helpful.
- Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits. Report observed results; missing or stale evidence is not success.
- These are communication/control patterns, not transferred ANSI, WHO, OSHA, FDA or NASA legal or organisational authority. Use other domain standards only when the task requires them.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.

## Task and boundary
- Assess selected SLSA 1.2 source or build requirements for a named artifact or process.
- Do not award a SLSA level from a signed checksum, an SBOM or a CI badge alone.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
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

## Verify and recover
- **Worked check (illustrative, not executed):** A release ships a SHA-256 file and declares the highest SLSA level.
- **Expected:** Verify the claimed track requirements and reject the unsupported leap from digest to supply-chain assurance.
- **If blocked:** Builder identity or provenance cannot be bound to the exact artifact. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
