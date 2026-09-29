---
name: standard-c2pa
description: "Verify Content Credentials without claiming factual truth."
---
# C2PA

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
- Inspect C2PA provenance for a particular media asset under an explicit trust policy.
- Do not infer that absent credentials prove falsity or that valid credentials prove the media's claims are true.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
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

## Verify and recover
- **Worked check (illustrative, not executed):** An authentic signer has signed an image that depicts a fabricated scene.
- **Expected:** Report the verified provenance separately from the truth of the depicted event.
- **If blocked:** The trust list, revocation evidence or exact original asset is unavailable. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
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
