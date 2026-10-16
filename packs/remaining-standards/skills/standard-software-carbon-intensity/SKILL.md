---
name: standard-software-carbon-intensity
description: "Measure software emissions per defined functional unit."
---
# Software Carbon Intensity / ISO/IEC 21031

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
- For normative requirements, retain uppercase MUST, MUST NOT, SHOULD, SHOULD NOT, and MAY with their existing force.
- For critical or risky work only, put warnings before hazards. Put hold points before critical or irreversible steps. Before destructive or hazardous work, verify actual state.
- When failure is plausible, state the expected result, failure sign, and recovery action.
- When a mechanism is difficult, explain it from simple foundations. When useful, contrast noncompliant and compliant code or configuration.
- For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result, and Recovery where useful. Add contrast or TL;DR only when helpful.
- Give progress only when requested or useful. Keep progress distinct from the verdict.

## Task and boundary
- Calculate or compare SCI for a defined software boundary. Use the selected GSF method.
- Do not replace SCI with purchased offsets, a cloud-provider slogan, or total energy alone.
- Work only on the selected artifact or assessment. This routine does not permit attacks, deployment, publication, or policy changes.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits, and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot provide missing requirements or prove conformance.
- Historical adoption decision: Project-local only. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Pin the method. Distinguish the open GSF specification from the licensed ISO/IEC 21031 text.
2. Define the software boundary, observation interval, and functional unit R before you collect measurements.
3. Estimate or measure energy E for the included software and hardware. Disclose the methods and units.
4. Use a defensible electricity carbon intensity I that matches location and time. Record assumptions and data sources.
5. Calculate operational emissions O = E × I. Use consistent units.
6. Allocate embodied hardware emissions M with the method's resource and time allocation rules. Do not silently omit these emissions.
7. Calculate SCI = (O + M) / R. Report uncertainty and exclusions.
8. Compare systems only when their boundaries, time conditions, and functional units are compatible. Preserve service quality and required behaviour.
9. Do not subtract offsets or renewable-energy certificates merely to lower the SCI score contrary to the method.
10. Report sufficient inputs and calculations to reproduce the result. Distinguish lower intensity from lower total emissions.

## Verify and recover
- **Worked check (illustrative, not executed):** Operational emissions are 200 gCO2e, allocated embodied emissions are 50 gCO2e, and 100 jobs complete.
- **Expected:** SCI is 2.5 gCO2e per job for that declared boundary; this does not establish the whole organisation's footprint.
- **If blocked:** If the functional unit or embodied-emissions allocation is undefined, stop the affected assessment or action. Record the missing prerequisite. Request it from the responsible owner. Continue only independent, authorised work.
- Retain facts, identifiers, links, required checks, permissions, negation, exceptions, and failure and recovery paths.
- Distinguish planned work, actual evidence, and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or meet the line budget. Record unresolved source or task conflicts.
- Use the smallest check that can detect the relevant defect. A schema, linter, or inventory alone does not prove task success.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements, and next permitted action.
- Make one correction pass. Recheck affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence, and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
