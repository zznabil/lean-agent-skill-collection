---
name: standard-software-carbon-intensity
description: "Measure software emissions per defined functional unit."
---
# Software Carbon Intensity / ISO/IEC 21031

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
- Calculate or compare SCI for a defined software boundary. Use the selected GSF method.
- Do not replace SCI with purchased offsets, a cloud-provider slogan, or total energy alone.
- Work only on the selected artefact or assessment. This routine does not permit attacks, deployment, publication, or policy changes.

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
- Keep planned work, observed evidence and unknown results separate. Missing or stale evidence is not a pass.
- Do not remove requirements for a score or line budget. Record unresolved source or task conflicts.
- Use the smallest check that detects the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Make one correction pass and recheck affected evidence. If a required issue remains, report it; do not loop or claim completion.
- Return the scoped result, source edition, evidence, limits, unresolved requirements and next permitted action. Do not claim formal conformance or model-behaviour improvement from this routine.
