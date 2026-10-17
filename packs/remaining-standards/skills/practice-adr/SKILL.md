---
name: practice-adr
description: "Record one architectural decision and its rationale."
---
# Architecture Decision Records

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
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

## Task scope and permissions
- Record a consequential architectural decision or supersede an existing decision.
- Do not create an ADR for every code edit. Do not rewrite history to suggest that a choice was unanimous.
- Limit work to the selected artefact or assessment. This routine grants no permission to run attacks, deploy, publish or change policy.

## Source and assessment limits
- Read [SOURCES.md](SOURCES.md). Identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check the relevant source sections before making a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Existing foundation. Preserve this boundary unless an authorised decision explicitly changes it.

## Decision-record procedure
1. Identify one architectural decision, its stakeholders and the requirement or constraint that makes it significant.
2. Inspect existing decision records and implementation before proposing a new decision.
3. Follow the repository's ADR format. If it has none, record title, status, context, options, decision and consequences.
4. Describe the actual alternatives. Include keeping the current design when feasible.
5. Explain the chosen option with evidence, assumptions and trade-offs. Do not rely only on preference or hindsight.
6. Distinguish a proposal from an accepted decision. Record the actual decision authority and date when known.
7. Link the relevant requirements, experiments, implementation and follow-up obligations.
8. Specify the conditions that would justify revisiting the decision.
9. If a decision changes, create or mark a superseding record. Keep the old rationale and links.
10. Check that the record describes the real decision and current status. Documentation alone does not implement the architecture.

## Verification and recovery
- **Worked check (illustrative, not executed):** An existing ADR selected queues; a new design selects synchronous calls.
- **Expected:** Create a superseding decision with reasons and migration consequences; keep the earlier ADR readable.
- **If blocked:** If no authorised decision or evidence distinguishes the alternatives, stop the affected assessment or action. Record the missing prerequisite and request it from the responsible owner. Continue only independent, authorised work.
- Keep planned work, observed evidence and unknown results separate. Missing or stale evidence is not a pass.
- Do not remove requirements for a score or line budget. Record unresolved source or task conflicts.
- Use the smallest check that detects the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Make one correction pass and recheck affected evidence. If a required issue remains, report it; do not loop or claim completion.
- Return the scoped result, source edition, evidence, limits, unresolved requirements and next permitted action. Do not claim formal conformance or model-behaviour improvement from this routine.
