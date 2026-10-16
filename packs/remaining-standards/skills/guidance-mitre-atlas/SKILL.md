---
name: guidance-mitre-atlas
description: "Map AI threat evidence to applicable ATLAS techniques."
---
# MITRE ATLAS

## Communication kernel
If trusted root `AGENTS.md` loads, follow it; otherwise apply this standalone fallback. Do not claim root activation without evidence.
- **Brevity:** Use the fewest words that complete the task. Start with the answer, result or blocker. Remove filler, repeated conclusions, routine narration and decorative headings. Do not add a **Summary** heading or closing **TL;DR**. Use a leading **TL;DR** only when it improves a complex answer.
- **Language:** Use ASD-STE100-inspired short, active sentences and concrete verbs.
- **Terms:** Use ISO 704-inspired consistent terms: one preferred term per distinct concept. Define unfamiliar terms when needed; preserve exact technical and UI strings.
- **Structure:** Use Diátaxis to separate how-to, reference, explanation and tutorial content only when this helps navigation.
- **Integrity:** Preserve facts, actors, conditions, negation, exceptions, permissions, requirements, source rights, uncertainty, evidence, accessibility and the requested voice or format. Do not omit required details just to shorten text.
- **Safety and proof:** Use BCP 14 force only for normative rules. Keep warning-before-hazard, verified safe state, hold points, expected results, failure signs and recovery when relevant. Report actual test outcomes; do not invent a pass.
These are writing guides, not proof of standards conformance or host behaviour. Task-specific source rules still apply.
## Execution safeguards
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Preserve requirement force.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Before destructive or hazardous work, verify actual state.
- When failure is plausible, state the expected result, failure sign and recovery. For critical procedures, keep prerequisites, warnings, verified holds, actions, expected results and recovery; add headings only when useful.
- When explaining difficult mechanisms, start with simple foundations. Contrast noncompliant and compliant code or configuration when useful.
- Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits. Report observed results. Missing or stale evidence is not success.
- These safeguards transfer no legal or organisational authority from ANSI, WHO, OSHA, FDA or NASA.
- Give progress only when requested or useful. Keep progress distinct from the verdict.

## Task and boundary
- Use MITRE ATLAS to organize a defensive AI threat analysis or evaluation.
- Do not infer exploitability, frequency or system compromise from a matching technique name alone.
- Work only on the selected artifact or assessment. This routine grants no permission to run attacks, deploy, publish or change policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) to identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot provide missing requirements or prove conformance.
- Historical adoption decision: Conditional threat source. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Pin the ATLAS data or page revision used. Identify the system and defensive question.
2. Map actual adversary goals and behaviours to relevant tactics and techniques.
3. Read the technique description, prerequisites and cited evidence. Do not rely on its title.
4. Distinguish documented case-study evidence from hypothetical applicability to the current system.
5. Identify affected assets, attacker access and the concrete path through the system.
6. Map preventive, detective and recovery controls to each selected technique.
7. Design bounded defensive checks in an authorised environment. Do not copy attack examples into live targets.
8. Record exact technique IDs, evidence, test conditions and untested assumptions.
9. Review gaps and duplicate mappings. Do not treat a larger technique count as a better assessment.
10. Report threat coverage within the selected scope and residual uncertainty. ATLAS is a living knowledge base, not a certification programme.

## Verify and recover
- **Worked check (illustrative, not executed):** A threat report lists an ATLAS technique without showing a reachable input or required attacker access.
- **Expected:** Treat applicability as unverified until evidence supports the system path and prerequisites.
- **If blocked:** If you cannot establish the exact technique revision or its prerequisites, stop the affected assessment or action. Record the missing prerequisite and request it from the responsible owner. Continue only independent, authorised work.
- Retain facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not remove requirements to improve a score or meet the line budget. Record any unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the result within the selected scope, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
