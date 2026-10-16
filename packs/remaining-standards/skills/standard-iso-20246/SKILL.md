---
name: standard-iso-20246
description: "Review a work product against explicit criteria."
---
# ISO/IEC 20246 work-product reviews

## Communication kernel
If trusted root `AGENTS.md` loads, follow it; otherwise apply this standalone fallback. Do not claim root activation without evidence.
- **Brevity:** Use the fewest words that complete the task. Start with the answer, result or blocker. Remove filler, repeated conclusions, routine narration and decorative headings. Do not add a **Summary** heading or closing **TL;DR**. Use a leading **TL;DR** only when it improves a complex answer.
- **Language:** Use ASD-STE100-inspired short, active sentences and concrete verbs.
- **Terms:** Use ISO 704-inspired consistent terms: one preferred term per distinct concept. Define unfamiliar terms when needed; preserve exact technical and UI strings.
- **Structure:** Use Diátaxis to separate how-to, reference, explanation and tutorial content only when this helps navigation.
- **Integrity:** Preserve facts, actors, conditions, negation, exceptions, permissions, requirements, source rights, uncertainty, evidence, accessibility and the requested voice or format. Do not omit required details just to shorten text.
- **Safety and proof:** Use BCP 14 force only for normative rules. Keep warning-before-hazard, verified safe state, hold points, expected results, failure signs and recovery when relevant. Report actual test outcomes; do not invent a pass.
These are writing guides, not proof of standards conformance or host behaviour. Task-specific source rules still apply.
## Conditional execution rules
- For normative requirements, retain uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY with their existing force. State one actor, action and observable verification target.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Before destructive or hazardous work, verify actual state.
- When failure is plausible, state the expected result, failure sign and recovery. Report observed results. Missing or stale evidence is not success.
- For difficult mechanisms, explain from simple foundations. When useful, contrast noncompliant and compliant code or configuration.
- For critical procedures, keep prerequisites, warnings, verified holds, actions, expected results and recovery; add headings only when useful.
- Give progress only when requested or useful. Keep progress distinct from the verdict.
- These rules transfer no legal or organisational authority. Use other domain standards only when the task requires them.

## Task and boundary
- Plan or conduct a structured review of a named work product.
- Do not present the author's unchecked assessment as independent approval.
- Work only on the selected artifact or assessment. This routine grants no permission to run attacks, deploy, publish or change policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md). Identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: No material change; lineage. Retain this boundary unless an authorised decision explicitly changes it.
- The full licensed text was not obtained. This Lean application routine uses public scope and existing Lean guidance. It is not a clause transcript.
- Obtain the authorised full text before a clause-level assessment. Do not invent definitions, thresholds or conformity results.

## Procedure
1. Identify the work product, revision, review purpose, applicable requirements and agreed exit conditions.
2. Use the existing project process to choose review roles and independence appropriate to the consequences.
3. Give reviewers the artifact and required context. Do not give only a persuasive summary.
4. Examine the artifact individually before consolidating issues where this is practical and useful.
5. Record each material anomaly's location, violated criterion, evidence and impact.
6. Discuss and classify anomalies. Distinguish preferences from defects.
7. Assign corrective work and disposition authority. Do not silently repair outside the requested scope.
8. Verify corrections against the current artifact. Retain unresolved issues and their owners.
9. Distinguish completed review activity from product acceptance.
10. For formal review-process claims, use the full licensed 20246 requirements and evidence of the actual process.

## Verify and recover
- **Worked check (illustrative, not executed):** The author says all review comments are resolved, but no reviewer inspected the new revision.
- **Expected:** Record correction claims as awaiting verification. Do not award independent acceptance.
- **If blocked:** If the artifact revision, criteria or required independent reviewer is unavailable, stop the affected assessment or action. Record the missing prerequisite and request it from the responsible owner. Continue only independent, authorised work.
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or meet the line budget. Record any unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
