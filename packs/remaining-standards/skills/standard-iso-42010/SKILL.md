---
name: standard-iso-42010
description: "Describe architecture through stakeholder concerns."
---
# ISO/IEC/IEEE 42010 architecture descriptions

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

## Task and boundary
- Create or review an architecture description for a specified entity of interest.
- Do not replace the architecture with a collection of diagrams. Do not mandate a modelling notation.
- Work only on the selected artefact or assessment. This routine does not permit attacks, deployment, publication or policy changes.

## Source and limits
- Read [SOURCES.md](SOURCES.md). Check source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot provide missing requirements or prove conformance.
- Historical adoption decision: Absorb. Preserve this boundary unless an authorised decision explicitly changes it.
- The full licensed text was not obtained. This Lean application routine uses public scope and existing Lean guidance. It is not a clause transcript.
- Obtain the authorised full text before a clause-level assessment. Do not invent definitions, thresholds or conformity results.

## Procedure
1. Name the entity of interest, its environment, stakeholders and architecturally significant concerns.
2. Select viewpoints that define how to address the relevant concerns.
3. Distinguish a viewpoint's conventions from a view of the actual system that uses those conventions.
4. Choose models and representations that answer stakeholder questions. Use existing project methods where suitable.
5. Record decisions and rationale for important structural choices and rejected alternatives.
6. Identify relationships and consistency rules between views. Expose contradictions; do not hide them.
7. Connect architecture descriptions to requirements, interfaces, deployment constraints and evidence.
8. State missing information, assumptions and unknown states explicitly.
9. Review the description with relevant stakeholders. Update it when the architecture changes.
10. Use the licensed 42010 edition for required content and conformance. This procedure is not a clause inventory.

## Verify and recover
- **Worked check (illustrative, not executed):** Two diagrams assign the same state to different owning services.
- **Expected:** Record and resolve the ownership inconsistency; do not call the architecture consistent because both diagrams
  render.
- **If blocked:** If the stakeholders, system boundary or authoritative ownership decision is unknown, stop the affected assessment or action. Record the missing prerequisite. Request it from the responsible owner. Continue only independent, authorised work.
- Keep planned work, observed evidence and unknown results separate. Missing or stale evidence is not a pass.
- Do not remove requirements for a score or line budget. Record unresolved source or task conflicts.
- Use the smallest check that detects the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Make one correction pass and recheck affected evidence. If a required issue remains, report it; do not loop or claim completion.
- Return the scoped result, source edition, evidence, limits, unresolved requirements and next permitted action. Do not claim formal conformance or model-behaviour improvement from this routine.
