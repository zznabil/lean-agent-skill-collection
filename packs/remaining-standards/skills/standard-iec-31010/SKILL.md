---
name: standard-iec-31010
description: "Choose a risk technique that matches the decision."
---
# IEC 31010 risk assessment techniques

## Communication kernel
If trusted root `AGENTS.md` loads, follow it; otherwise apply this standalone fallback. Do not claim root activation without evidence.
- **Brevity:** Use the fewest words that complete the task. Start with the answer, result or blocker. Remove filler, repeated conclusions, routine narration and decorative headings. Do not add a **Summary** heading or closing **TL;DR**. Use a leading **TL;DR** only when it improves a complex answer.
- **Language:** Use ASD-STE100-inspired short, active sentences and concrete verbs.
- **Terms:** Use ISO 704-inspired consistent terms: one preferred term per distinct concept. Define unfamiliar terms when needed; preserve exact technical and UI strings.
- **Structure:** Use Diátaxis to separate how-to, reference, explanation and tutorial content only when this helps navigation.
- **Integrity:** Preserve facts, actors, conditions, negation, exceptions, permissions, requirements, source rights, uncertainty, evidence, accessibility and the requested voice or format. Do not omit required details just to shorten text.
- **Safety and proof:** Use BCP 14 force only for normative rules. Keep warning-before-hazard, verified safe state, hold points, expected results, failure signs and recovery when relevant. Report actual test outcomes; do not invent a pass.
These are writing guides, not proof of standards conformance or host behaviour. Task-specific source rules still apply.
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
