---
name: practice-adr
description: "Record one architectural decision and its rationale."
---
# Architecture Decision Records

## Task and boundary
- Capture a consequential architectural decision or supersede an existing one.
- Do not write an ADR for every code edit or rewrite history to make a choice appear unanimous.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Existing foundation. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify one architecturally significant decision, the stakeholders and the requirement or constraint that makes it significant.
2. Inspect existing decision records and implementation before proposing a new decision.
3. Use the repository's ADR format; otherwise record title, status, context, options, decision and consequences.
4. Describe the actual alternatives, including retaining the current design when feasible.
5. Explain the chosen option using evidence, assumptions and trade-offs, not only preference or hindsight.
6. Separate a proposal from an accepted decision. Record the actual decision authority and date when known.
7. Link relevant requirements, experiments, implementation and follow-up obligations.
8. State the conditions that would justify revisiting the decision.
9. When a decision changes, create or mark a superseding record and retain the old rationale and links.
10. Verify the record describes the real decision and current status; documentation alone does not implement the architecture.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** An existing ADR selected queues; a new design selects synchronous calls.
- **Expected:** Create a superseding decision with reasons and migration consequences; keep the earlier ADR readable.
- **Missing-evidence case:** No authorised decision or evidence distinguishes the alternatives.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
