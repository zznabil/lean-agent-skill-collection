---
name: standard-nist-ai-ssdf
description: "Apply the AI SSDF profile with its base framework."
---
# NIST SP 800-218A

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
- Use SP 800-218A to review secure development of generative AI or dual-use foundation-model systems.
- Do not replace SSDF 1.1 with this AI profile. Do not treat the profile as proof of complete AI trustworthiness.
- Work only on the selected artefact or assessment. This routine does not permit attacks, deployment, publication or policy changes.

## Source and limits
- Read [SOURCES.md](SOURCES.md). Identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot provide missing requirements or prove conformance.
- Historical adoption decision: Conditional benchmark. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Define the AI-system boundary and applicable role: model producer, system producer or acquirer.
2. Read SP 800-218A with SP 800-218. Map the profile's additions and considerations to the base practices.
3. Identify the model, data, code, infrastructure and third-party components that affect the security outcome.
4. Where relevant, record the provenance, allowed use, access control and integrity of training, tuning and evaluation inputs.
5. Protect model artefacts and development environments against unauthorised modification or disclosure.
6. Review model acquisition and integration assumptions. Do not assume that popularity makes an upstream model safe.
7. Use representative, authorised tests to evaluate applicable AI-specific threats and failure modes.
8. Record responsibilities for secure deployment, monitoring, vulnerability response and updates across the selected lifecycle.
9. Retain evidence for the exact model/data/configuration revisions. A material change can invalidate earlier results.
10. Report assessed profile requirements, base-framework dependencies and gaps. Do not present this review as a model-performance endorsement.

## Verify and recover
- **Worked check (illustrative, not executed):** An AI release passes application tests, but the deployed model hash differs from the evaluated model.
- **Expected:** Report the integrity/evidence mismatch. Re-establish the evaluated artefact before claiming readiness.
- **If blocked:** If model or training/tuning data provenance cannot be established, stop the affected assessment or action. Record the missing prerequisite and request it from the responsible owner. Continue only independent, authorised work.
- Keep planned work, observed evidence and unknown results separate. Missing or stale evidence is not a pass.
- Do not remove requirements for a score or line budget. Record unresolved source or task conflicts.
- Use the smallest check that detects the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Make one correction pass and recheck affected evidence. If a required issue remains, report it; do not loop or claim completion.
- Return the scoped result, source edition, evidence, limits, unresolved requirements and next permitted action. Do not claim formal conformance or model-behaviour improvement from this routine.
