---
name: standard-software-carbon-intensity
description: "Measure software emissions per defined functional unit."
---
# Software Carbon Intensity / ISO/IEC 21031

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root `AGENTS.md` loads, its policy governs this skill. Otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences. State the main point first. Use familiar words and keep simple replies short.
- Use ISO 704-inspired stable concepts and terminology. Keep each actor, action, and observable verification target clear. Preserve requirement force, facts, negation, conditions, exceptions, permissions, safety, source scope, and evidence limits.
- Use Diátaxis organization when helpful. Separate instructions, reference, and explanation. These three approaches guide default communication; they do not establish formal standards conformance or transfer legal or organisational authority. Use other domain standards only when the task requires them.

## Conditional execution rules
- For normative requirements, retain uppercase MUST, MUST NOT, SHOULD, SHOULD NOT, and MAY with their existing force.
- For critical or risky work only, put warnings before hazards. Put hold points before critical or irreversible steps. Before destructive or hazardous work, verify actual state.
- When failure is plausible, state the expected result, failure sign, and recovery action.
- When a mechanism is difficult, explain it from simple foundations. When useful, contrast noncompliant and compliant code or configuration.
- For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result, and Recovery where useful. Add contrast or TL;DR only when helpful.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable. Report observed results. Missing or stale evidence is not success.

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
