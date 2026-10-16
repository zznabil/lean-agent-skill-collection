---
name: standard-iso-12207
description: "Trace software delivery across its selected lifecycle."
---
# ISO/IEC/IEEE 12207

## Communication kernel
If trusted root `AGENTS.md` loads, follow it; otherwise apply this standalone fallback. Do not claim root activation without evidence.
- **Brevity:** Use the fewest words that complete the task. Start with the answer, result or blocker. Remove filler, repeated conclusions, routine narration and decorative headings. Do not add a **Summary** heading or closing **TL;DR**. Use a leading **TL;DR** only when it improves a complex answer.
- **Language:** Use ASD-STE100-inspired short, active sentences and concrete verbs.
- **Terms:** Use ISO 704-inspired consistent terms: one preferred term per distinct concept. Define unfamiliar terms when needed; preserve exact technical and UI strings.
- **Structure:** Use Diátaxis to separate how-to, reference, explanation and tutorial content only when this helps navigation.
- **Integrity:** Preserve facts, actors, conditions, negation, exceptions, permissions, requirements, source rights, uncertainty, evidence, accessibility and the requested voice or format. Do not omit required details just to shorten text.
- **Safety and proof:** Use BCP 14 force only for normative rules. Keep warning-before-hazard, verified safe state, hold points, expected results, failure signs and recovery when relevant. Report actual test outcomes; do not invent a pass.
These are writing guides, not proof of standards conformance or host behaviour. Task-specific source rules still apply.
## Conditional execution rules
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Preserve requirement force. Identify one actor, action and observable verification target for each requirement.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Before destructive or hazardous work, verify the actual state.
- When failure is plausible, state the expected result, failure sign and recovery action.
- When explaining a difficult mechanism, start from simple foundations. When useful, contrast noncompliant and compliant code or configuration.
- For critical procedures, keep prerequisites, warnings, verified holds, actions, expected results and recovery; add headings only when useful.
- Give progress only when requested or useful. Keep progress distinct from the verdict.

## Task and boundary
- Review lifecycle obligations for a software change, delivery or retirement.
- Do not impose a waterfall model or a new management system on a project that did not adopt one.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md). Identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Existing foundation. Keep this boundary unless an authorised decision explicitly changes it.
- The full licensed text was not obtained. This Lean application routine uses public scope and existing Lean guidance. It is not a clause transcript.
- Obtain the authorised full text before a clause-level assessment. Do not invent definitions, thresholds or conformity results.

## Procedure
1. Identify the lifecycle scope, stakeholders, agreements, software boundary and selected process obligations.
2. Tailor activities to the actual project. Record approved omissions. Do not silently delete obligations.
3. Carry requirements and acceptance evidence through development and integration. Do not limit them to source implementation.
4. Include acquisition and supplier responsibilities where externally provided software affects the outcome.
5. Plan transition, operation, maintenance, support, recovery and eventual disposal where they fall within scope.
6. Name the owner, inputs, outputs and evidence for each selected process outcome.
7. Check operational configuration, startup, data handling, support information and rollback before a consequential transition.
8. Distinguish build completion, acceptance, deployment and operational readiness. One state does not prove the others.
9. Preserve approval and change-control boundaries when moving work to the next lifecycle stage.
10. Use the full selected edition for a contractual assessment. The standard does not mandate one lifecycle model or methodology.

## Verify and recover
- **Worked check (illustrative, not executed):** The package builds, but its agreed recovery exercise has not run.
- **Expected:** Mark recovery evidence incomplete; do not declare the lifecycle delivery finished.
- **If blocked:** If transition ownership, recovery criteria or the governing process agreement is missing, stop the affected assessment or action. Record the missing prerequisite. Request it from the responsible owner. Continue only independent, authorised work.
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or meet the line budget. Record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
