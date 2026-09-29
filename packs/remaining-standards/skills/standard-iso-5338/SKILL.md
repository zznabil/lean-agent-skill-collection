---
name: standard-iso-5338
description: "Track AI-specific work across a selected lifecycle."
---
# ISO/IEC 5338 AI lifecycle

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
- Plan or review lifecycle work for a named AI system under project-selected requirements.
- Do not treat an AI lifecycle template as proof of model quality or replace the project's established lifecycle without approval.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Conditional benchmark. Keep this boundary unless an authorised decision explicitly changes it.
- Full licensed text was not obtained. This is a Lean application routine grounded in public scope and existing Lean guidance, not a
  clause transcript.
- Obtain the authorised full text before a clause-level assessment. Do not invent definitions, thresholds or conformity results.

## Procedure
1. Identify the AI-system boundary, stakeholders, lifecycle stage and relationship to existing system/software processes.
2. Record intended use, affected people, operational context and the selected process obligations.
3. Trace data acquisition, preparation, model development, integration and evaluation activities relevant to the system.
4. Assign responsibility for models, datasets, infrastructure and third-party components.
5. Plan transition, operation, monitoring, maintenance, change and retirement where they fall in scope.
6. Define evidence and decision points for material changes to data, models, configuration or intended use.
7. Separate training success, evaluation success and operational acceptance.
8. Keep risk, security, privacy and human-oversight responsibilities connected to the relevant lifecycle activity.
9. Record residual gaps and re-evaluation triggers instead of declaring the lifecycle complete at deployment.
10. Use the licensed ISO/IEC 5338 source for formal process requirements; the steps here are Lean application guidance.

## Verify and recover
- **Worked check (illustrative, not executed):** A retrained model replaces the evaluated model without a new acceptance decision.
- **Expected:** Record the changed model and affected evidence, then complete the required re-evaluation before acceptance.
- **If blocked:** The deployed model, data revision or lifecycle owner is unknown. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
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
