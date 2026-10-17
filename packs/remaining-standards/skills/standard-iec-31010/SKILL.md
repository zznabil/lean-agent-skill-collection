---
name: standard-iec-31010
description: "Choose a risk technique that matches the decision."
---
# IEC 31010 risk assessment techniques

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
- Select and apply a risk-assessment technique for a concrete decision.
- For a simple low-risk decision, do not require every technique, a full FMEA or a numeric model.
- Limit work to the selected artefact or assessment. This routine grants no permission to run attacks, deploy, publish or change policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md). Check source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot provide missing requirements or prove conformance.
- Historical adoption decision: Project-local reference. Keep this boundary unless an authorised decision explicitly changes it.
- The full licensed text was not obtained. This Lean application routine uses public scope and existing Lean guidance. It is not a clause transcript.
- Obtain the authorised full text before a clause-level assessment. Do not invent definitions, thresholds or conformity results.

## Procedure
1. Define the risk question, decision stakes, lifecycle stage, available time and expertise.
2. Identify available evidence, its quality and important uncertainties.
3. Use authoritative technique guidance to select methods that suit those conditions.
4. Explain what the selected technique can and cannot establish.
5. Specify inputs, assumptions, participants and outputs before applying the technique.
6. Separate observed data from expert estimates and scenario assumptions.
7. Test whether the method overlooks interactions, common causes or dependency effects that matter to the decision.
8. Check sensitivity when results depend strongly on uncertain inputs.
9. Present the result that matters to the decision, its limitations and residual uncertainty to the authorised owner.
10. Use the licensed IEC 31010 edition for the method's actual instructions. Do not reconstruct unavailable technique tables from memory.

## Verify and recover
- **Worked check (illustrative, not executed):** A project lacks failure-rate data but asks for an exact probability estimate.
- **Expected:** Use an appropriate qualitative or scenario approach and expose uncertainty rather than fabricate a quantitative
  model.
- **If blocked:** If the technique requires expertise or data that the task lacks, stop the affected assessment or action. Record the missing prerequisite. Request it from the responsible owner. Continue only independent, authorised work.
- Keep planned work, observed evidence and unknown results separate. Missing or stale evidence is not a pass.
- Do not remove requirements for a score or line budget. Record unresolved source or task conflicts.
- Use the smallest check that detects the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Make one correction pass and recheck affected evidence. If a required issue remains, report it; do not loop or claim completion.
- Return the scoped result, source edition, evidence, limits, unresolved requirements and next permitted action. Do not claim formal conformance or model-behaviour improvement from this routine.
