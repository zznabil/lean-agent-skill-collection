---
name: practice-blameless-postmortems
description: "Turn an incident into evidence-backed systemic learning."
---
# Google SRE blameless postmortems

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
- Write or review a postmortem for a real incident that meets the project's review criteria.
- Do not blame individuals, invent a single root cause or use a retrospective to silently change production.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: No major change; lineage. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. State incident scope, impact, detection, duration and the evidence supporting the timeline.
2. Separate confirmed events from recollections, estimates and unresolved hypotheses.
3. Describe the conditions, information and constraints under which people and systems acted.
4. Analyse contributing technical and organisational factors rather than stopping at human error.
5. Record what went well, what failed and where luck limited the outcome.
6. Connect proposed actions to specific observed failure modes or missing safeguards.
7. Give each action an owner, verification method and appropriate prioritisation or due condition.
8. Review the draft with relevant participants and preserve disagreements that remain unresolved.
9. Track whether corrective actions changed the system or process; a published document alone does not close the risk.
10. Share within the authorised audience, protecting sensitive information and preserving a blameless learning purpose.

## Verify and recover
- **Worked check (illustrative, not executed):** A report concludes that an operator should have been more careful.
- **Expected:** Investigate the system conditions and safeguards that made the error consequential, then define a verifiable
  improvement.
- **If blocked:** The timeline or claimed contributing cause is not supported by available evidence. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
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
