---
name: guidance-mitre-atlas
description: "Map AI threat evidence to applicable ATLAS techniques."
---
# MITRE ATLAS

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root `AGENTS.md` is loaded, its policy governs this skill. Otherwise you MUST apply this kernel; skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences. Lead with the main point and familiar words. Keep simple replies short.
- Use ISO 704-inspired stable concepts and terminology. Keep each actor, action and observable verification target clear.
- Use Diátaxis organization to separate how-to, reference and explanation when useful. These three approaches are the default prose drivers, not formal standards conformance. Use other domain standards only when the task requires them.

## Execution safeguards
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Preserve requirement force.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Before destructive or hazardous work, verify actual state.
- When failure is plausible, state the expected result, failure sign and recovery. For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful. Add contrast or TL;DR only when helpful.
- When explaining difficult mechanisms, start with simple foundations. Contrast noncompliant and compliant code or configuration when useful.
- Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits. Report observed results. Missing or stale evidence is not success.
- These safeguards transfer no legal or organisational authority from ANSI, WHO, OSHA, FDA or NASA.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.

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
