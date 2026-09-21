---
name: standard-iso-15026-2
description: "Build an assurance argument tied to current evidence."
---
# ISO/IEC/IEEE 15026-2 assurance cases

## Task and boundary
- Structure or review a consequential assurance claim for a named system or artifact.
- Do not replace testing, independent review or domain approval with a persuasive narrative.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Strongly absorb. Keep this boundary unless an authorised decision explicitly changes it.
- Full licensed text was not obtained. This is a Lean application routine grounded in public scope and existing Lean guidance, not a
  clause transcript.
- Obtain the authorised full text before a clause-level assessment. Do not invent definitions, thresholds or conformity results.

## Procedure
1. State the top-level claim, system boundary, operating assumptions and intended decision.
2. Separate the claim from the argument that supports it and the evidence offered for that argument.
3. Break the claim into subclaims only where that clarifies a real reasoning obligation.
4. For each evidence item, identify its source, revision, environment, scope and limitations.
5. Explain why the evidence supports the claim; a test result label is not an argument by itself.
6. Identify assumptions, contrary evidence, plausible defeaters and unresolved gaps.
7. Check that the argument does not claim more than its evidence observes, including deployment and authentication boundaries.
8. Record changes that invalidate evidence and the required re-verification.
9. Do not mark a required assurance claim established while a material gap remains; seek an authorised scope decision if needed.
10. Use the licensed edition and qualified domain process for a formal assurance-case assessment.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** A staging test is used to claim that all production failure modes are safe.
- **Expected:** Limit the supported claim to the tested setting and identify the missing production-equivalence evidence.
- **Missing-evidence case:** A supporting test cannot be reproduced or its artifact revision is unknown.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
