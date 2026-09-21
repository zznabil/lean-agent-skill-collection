---
name: practice-atam
description: "Expose architectural risks with quality scenarios."
---
# ATAM

## Task and boundary
- Perform a bounded, explicitly lightweight ATAM-informed trade-off review.
- Do not present a short solo review as the complete facilitated ATAM method.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Absorb mini form. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Agree the decision, stakeholders, business drivers, system boundary and review timebox.
2. Present the architecture as it is understood, including significant assumptions and architectural approaches.
3. Elicit concrete quality-attribute scenarios instead of vague goals such as fast or flexible.
4. Prioritise scenarios by stakeholder importance and architectural difficulty or risk.
5. Trace each priority scenario through the architecture and identify mechanisms that support the required response.
6. Identify sensitivity points where changing an architectural parameter substantially affects a quality response.
7. Identify trade-off points where a choice affects more than one quality attribute.
8. Record risks, non-risks supported by evidence, unresolved assumptions and broader risk themes separately.
9. Compare realistic alternatives and record the evidence or experiment needed for unresolved high-impact assumptions.
10. Report the lightweight scope, participants and omissions; do not imply a full ATAM evaluation or certification.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** Increasing a cache lifetime reduces latency but increases stale-data exposure.
- **Expected:** Record a trade-off point, the relevant scenarios and the decision owner; do not claim both attributes improved
  without measurements.
- **Missing-evidence case:** A claimed architectural response depends on an untested assumption.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
