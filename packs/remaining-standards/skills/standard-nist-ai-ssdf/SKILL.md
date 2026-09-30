---
name: standard-nist-ai-ssdf
description: "Apply the AI SSDF profile with its base framework."
---
# NIST SP 800-218A

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root `AGENTS.md` is loaded, its policy governs this skill. Otherwise, you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences. Lead with the main point and familiar words. Keep simple replies short.
- Use ISO 704-inspired stable concepts and terminology. Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits.
- Use Diátaxis organization. Separate how-to, reference and explanation when useful. These three approaches are the default communication drivers, not a claim of formal standards conformance.
- When stating normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Preserve requirement force. State one actor, action and observable verification target.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Before destructive or hazardous work, verify actual state.
- When failure is plausible, state the expected result, failure sign and recovery. For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful. Add contrast or TL;DR only when helpful.
- When explaining difficult mechanisms, start from simple foundations. Contrast noncompliant and compliant code or configuration when useful.
- Report observed results. Missing or stale evidence is not success. For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.
- These communication and control patterns do not transfer legal or organisational authority from external frameworks. Use other domain standards only when the task requires them.

## Task and boundary
- Use SP 800-218A to review secure development of generative AI or dual-use foundation-model systems.
- Do not replace SSDF 1.1 with this AI profile. Do not treat the profile as proof of complete AI trustworthiness.
- Work only on the selected artifact or assessment. This routine does not permit attacks, deployment, publication or policy changes.

## Source and limits
- Read [SOURCES.md](SOURCES.md). Identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot provide missing requirements or prove conformance.
- Historical adoption decision: Conditional benchmark. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the applicable role: model producer, system producer or acquirer. Define the AI-system boundary.
2. Read SP 800-218A with SP 800-218. Map the profile's additions and considerations to the base practices.
3. Identify the model, data, code, infrastructure and third-party components that affect the security outcome.
4. Where relevant, record the provenance, allowed use, access control and integrity of training, tuning and evaluation inputs.
5. Protect model artifacts and development environments against unauthorised modification or disclosure.
6. Review model acquisition and integration assumptions. Do not assume that popularity makes an upstream model safe.
7. Use representative, authorised tests to evaluate applicable AI-specific threats and failure modes.
8. Record responsibilities for secure deployment, monitoring, vulnerability response and updates across the selected lifecycle.
9. Retain evidence for the exact model/data/configuration revisions. A material change can invalidate earlier results.
10. Report assessed profile requirements, base-framework dependencies and gaps. Do not present this review as a model-performance endorsement.

## Verify and recover
- **Worked check (illustrative, not executed):** An AI release passes application tests, but the deployed model hash differs from the evaluated model.
- **Expected:** Report the integrity/evidence mismatch. Re-establish the evaluated artifact before claiming readiness.
- **If blocked:** If model or training/tuning data provenance cannot be established, stop the affected assessment or action. Record the missing prerequisite and request it from the responsible owner. Continue only independent, authorised work.
- Keep facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths intact.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not remove requirements to improve a score or meet the line budget. Record any unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the result for the selected scope, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
