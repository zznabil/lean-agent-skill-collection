---
name: standard-c2pa
description: "Verify Content Credentials without claiming factual truth."
---
# C2PA

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
- Inspect C2PA provenance for a specified media asset. Use an explicit trust policy.
- Do not infer that absent credentials prove falsity. Do not infer that valid credentials prove the media's claims are true.
- Work only on the selected artefact or assessment. This routine does not authorise attacks, deployment, publication or policy changes.

## Source and limits
- Read [SOURCES.md](SOURCES.md). Identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot provide missing requirements or prove conformance.
- Historical adoption decision: Project-local only. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Pin the C2PA specification version, validator, asset bytes and assessment trust policy.
2. Find the relevant manifest store. Identify the active manifest under the format's rules.
3. Verify claim signatures, credential validity and the binding between the manifest and the actual asset.
4. Evaluate signer trust separately from cryptographic signature validity.
5. Inspect assertions, ingredients and recorded actions within their stated scope. Do not invent missing history.
6. Check changes, redactions and ingredient relationships against the specification and available evidence.
7. Treat assertions as attributed statements. They do not automatically prove that depicted events or editorial claims are true.
8. Protect privacy. Do not add, sign, strip or publish credentials without the relevant authority.
9. Use the validator to test altered-asset and invalid-credential cases when needed to establish its behaviour.
10. Report validated provenance, trust decisions, errors and unknowns. Use terms that let the user distinguish these results from content truth.

## Verify and recover
- **Worked check (illustrative, not executed):** An authentic signer has signed an image that depicts a fabricated scene.
- **Expected:** Report the verified provenance separately from the truth of the depicted event.
- **If blocked:** If the trust list, revocation evidence or exact original asset is unavailable, stop the affected assessment or action. Record the missing prerequisite. Request it from the responsible owner. Continue only independent, authorised work.
- Keep planned work, observed evidence and unknown results separate. Missing or stale evidence is not a pass.
- Do not remove requirements for a score or line budget. Record unresolved source or task conflicts.
- Use the smallest check that detects the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Make one correction pass and recheck affected evidence. If a required issue remains, report it; do not loop or claim completion.
- Return the scoped result, source edition, evidence, limits, unresolved requirements and next permitted action. Do not claim formal conformance or model-behaviour improvement from this routine.
