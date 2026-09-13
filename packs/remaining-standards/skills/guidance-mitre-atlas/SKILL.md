---
name: guidance-mitre-atlas
description: "Map AI threat evidence to applicable ATLAS techniques."
---
# MITRE ATLAS

## Task and boundary
- Use MITRE ATLAS to organise a defensive AI threat analysis or evaluation.
- Do not infer exploitability, frequency or system compromise solely from a matching technique name.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Conditional threat source. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Pin the ATLAS data or page revision used and identify the system and defensive question.
2. Map actual adversary goals and behaviours to relevant tactics and techniques.
3. Read the technique description, prerequisites and cited evidence rather than relying on its title.
4. Separate documented case-study evidence from hypothetical applicability to the current system.
5. Identify affected assets, attacker access and the concrete path through the system.
6. Map preventive, detective and recovery controls to each selected technique.
7. Design bounded defensive checks in an authorised environment; do not copy attack examples into live targets.
8. Capture exact technique IDs, evidence, test conditions and untested assumptions.
9. Review gaps and duplicate mappings without treating a larger technique count as a better assessment.
10. Report the scoped threat coverage and residual uncertainty; ATLAS is a living knowledge base, not a certification programme.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** A threat report lists an ATLAS technique without showing a reachable input or required attacker access.
- **Expected:** Treat applicability as unverified until the system path and prerequisites are supported.
- **Missing-evidence case:** The exact technique revision or its prerequisites cannot be established.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
