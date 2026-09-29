---
name: practice-adr
description: "Record one architectural decision and its rationale."
---
# Architecture Decision Records

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
- Capture a consequential architectural decision or supersede an existing one.
- Do not write an ADR for every code edit or rewrite history to make a choice appear unanimous.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
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

## Verify and recover
- **Worked check (illustrative, not executed):** An existing ADR selected queues; a new design selects synchronous calls.
- **Expected:** Create a superseding decision with reasons and migration consequences; keep the earlier ADR readable.
- **If blocked:** No authorised decision or evidence distinguishes the alternatives. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
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
