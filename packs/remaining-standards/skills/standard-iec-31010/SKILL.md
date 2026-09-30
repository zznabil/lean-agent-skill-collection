---
name: standard-iec-31010
description: "Choose a risk technique that matches the decision."
---
# IEC 31010 risk assessment techniques

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root `AGENTS.md` is loaded, its policy governs this skill. Otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences. State the main point first. Use familiar words and keep simple replies short.
- Use ISO 704-inspired stable concepts and terminology. Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits.
- Use Diátaxis organization to separate how-to, reference and explanation when useful. These three approaches are the default communication drivers, not a claim of formal standards conformance.
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. State one actor, action and observable verification target.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Before destructive or hazardous work, verify actual state.
- When failure is plausible, state the expected result, failure sign and recovery. For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful.
- When a mechanism is difficult, explain it from simple foundations. Contrast noncompliant and compliant code or configuration when useful. Add contrast or TL;DR only when helpful.
- Report observed results. Missing or stale evidence is not success. For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.
- These execution rules do not transfer legal or organisational authority from other frameworks. Use other domain standards only when the task requires them.

## Task and boundary
- Select and apply a risk-assessment technique for a concrete decision.
- For a simple low-risk decision, do not require every technique, a full FMEA or a numeric model.
- Limit work to the selected artifact or assessment. This routine grants no permission to run attacks, deploy, publish or change policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md). Check source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot provide missing requirements or prove conformance.
- Historical adoption decision: Project-local reference. Keep this boundary unless an authorised decision explicitly changes it.
- The full licensed text was not obtained. This Lean application routine uses public scope and existing Lean guidance. It is not a clause transcript.
- Obtain the authorised full text before a clause-level assessment. Do not invent definitions, thresholds or conformity results.

## Procedure
1. Define the risk question, decision stakes, lifecycle stage, available time and available expertise.
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
- Keep facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths intact.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not remove requirements to improve a score or meet the line budget. Record any unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the result for the selected scope, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck the affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
