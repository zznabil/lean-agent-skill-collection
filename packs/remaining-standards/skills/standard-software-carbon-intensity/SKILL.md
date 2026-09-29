---
name: standard-software-carbon-intensity
description: "Measure software emissions per defined functional unit."
---
# Software Carbon Intensity / ISO/IEC 21031

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
- Calculate or compare SCI for a defined software boundary using the selected GSF method.
- Do not substitute purchased offsets, a cloud-provider slogan or total energy alone for SCI.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Project-local only. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Pin the method and distinguish the open GSF specification from the licensed ISO/IEC 21031 text.
2. Define the software boundary, observation interval and functional unit R before collecting measurements.
3. Estimate or measure energy E for the included software and hardware using disclosed methods and units.
4. Use a defensible electricity carbon intensity I aligned with location and time; record assumptions and data sources.
5. Calculate operational emissions O = E × I using consistent units.
6. Allocate embodied hardware emissions M using the method's resource and time allocation rules; do not silently omit them.
7. Calculate SCI = (O + M) / R and report uncertainty and exclusions.
8. Compare systems only with compatible boundaries, time conditions and functional units; preserve service quality and required
   behaviour.
9. Do not subtract offsets or renewable-energy certificates merely to lower the SCI score contrary to the method.
10. Report enough inputs and calculations to reproduce the result; distinguish lower intensity from lower total emissions.

## Verify and recover
- **Worked check (illustrative, not executed):** Operational emissions are 200 gCO2e, allocated embodied emissions are 50 gCO2e, and 100 jobs complete.
- **Expected:** SCI is 2.5 gCO2e per job for that declared boundary; this does not establish the whole organisation's footprint.
- **If blocked:** The functional unit or embodied-emissions allocation is not defined. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
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
