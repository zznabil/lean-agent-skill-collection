---
name: standard-software-carbon-intensity
description: "Measure software emissions per defined functional unit."
---
# Software Carbon Intensity / ISO/IEC 21031

## Task and boundary
- Calculate or compare SCI for a defined software boundary using the selected GSF method.
- Do not substitute purchased offsets, a cloud-provider slogan or total energy alone for SCI.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
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

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** Operational emissions are 200 gCO2e, allocated embodied emissions are 50 gCO2e, and 100 jobs complete.
- **Expected:** SCI is 2.5 gCO2e per job for that declared boundary; this does not establish the whole organisation's footprint.
- **Missing-evidence case:** The functional unit or embodied-emissions allocation is not defined.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
