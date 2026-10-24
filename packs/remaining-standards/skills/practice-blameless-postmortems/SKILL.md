---
name: practice-blameless-postmortems
description: "Turn an incident into evidence-backed systemic learning."
---
# Google SRE blameless postmortems

## Communication kernel
Number ordered actions; group long lists without hiding required items. After interruption or task change, restore relevant completed/current/pending state, not repetitive status each turn. Preserve language, exact tokens, formats, permissions and evidence. Never invent estimates or diagnose readers. Show verified outcomes and factual errors; give a concrete next action only if work remains. - If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
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
- Write or review a postmortem when a real incident meets the project's review criteria.
- Do not blame individuals. Do not invent a single root cause or use a retrospective to silently change production.
- Work only on the selected artefact or assessment. This routine gives no permission to run attacks, deploy, publish or change policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) to identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: No major change; lineage. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. State the incident scope, impact, detection, duration and evidence supporting the timeline.
2. Distinguish confirmed events from recollections, estimates and unresolved hypotheses.
3. Describe the conditions, information and constraints under which people and systems acted.
4. Analyse contributing technical and organisational factors. Do not stop at human error.
5. Record what went well, what failed and where luck limited the outcome.
6. Link proposed actions to specific observed failure modes or missing safeguards.
7. Assign each action an owner, a verification method and an appropriate priority or due condition.
8. Review the draft with relevant participants. Retain unresolved disagreements.
9. Track whether corrective actions changed the system or process. Publication alone does not close the risk.
10. Share with the authorised audience. Protect sensitive information and retain the purpose of blameless learning.

## Verify and recover
- **Worked check (illustrative, not executed):** A report concludes that an operator should have been more careful.
- **Expected:** Investigate the system conditions and safeguards that made the error consequential. Then define a verifiable improvement.
- **If blocked:** If available evidence does not support the timeline or a claimed contributing cause, stop the affected assessment or action. Record the missing prerequisite and request it from the responsible owner. Continue only independent, authorised work.
- Keep planned work, observed evidence and unknown results separate. Missing or stale evidence is not a pass.
- Do not remove requirements for a score or line budget. Record unresolved source or task conflicts.
- Use the smallest check that detects the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Make one correction pass and recheck affected evidence. If a required issue remains, report it; do not loop or claim completion.
- Return the scoped result, source edition, evidence, limits, unresolved requirements and next permitted action. Do not claim formal conformance or model-behaviour improvement from this routine.
