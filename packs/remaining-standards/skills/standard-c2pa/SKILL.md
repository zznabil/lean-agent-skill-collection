---
name: standard-c2pa
description: "Verify Content Credentials without claiming factual truth."
---
# C2PA

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
- Inspect C2PA provenance for a specified media asset. Use an explicit trust policy.
- Do not infer that absent credentials prove falsity. Do not infer that valid credentials prove the media's claims are true.
- Work only on the selected artifact or assessment. This routine does not authorise attacks, deployment, publication or policy changes.

## Source and limits
- Read [SOURCES.md](SOURCES.md). Identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot provide missing requirements or prove conformance.
- Historical adoption decision: Project-local only. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Fix the C2PA specification version, validator, asset bytes and trust policy for the assessment.
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
- Retain facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not remove requirements to improve a score or meet the line budget. Record any unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the result for the selected scope, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
