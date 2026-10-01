---
name: guidance-nist-adversarial-ml
description: "Classify an AI threat before selecting a defence."
---
# NIST AI 100-2e2025 adversarial ML taxonomy

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root `AGENTS.md` is loaded, its policy governs this skill. Otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences. Lead with the main point and familiar words. Keep simple replies short.
- Use ISO 704-inspired stable concepts and terminology. Preserve requirement force, actors, actions, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits.
- Use Diátaxis organization when helpful. Separate how-to guidance, reference and explanation. These three principles are the default communication drivers, not claims of formal standards conformance. Use other domain standards only when the task requires them.

## Conditional execution rules
- When expressing normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. State one actor, action and observable verification target per requirement.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Before destructive or hazardous work, verify the actual state.
- When failure is plausible, state the expected result, failure sign and recovery action.
- When explaining difficult mechanisms, start with simple foundations. Contrast noncompliant and compliant code or configuration when useful.
- For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful. Add contrast or TL;DR only when helpful.
- These execution rules do not transfer external legal or organisational authority. Report observed results. Missing or stale evidence is not success.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.

## Task and boundary
- Analyse an adversarial-ML threat scenario for a specified AI system.
- Do not use a taxonomy entry as evidence of exploit prevalence, an attack recipe or a probability estimate.
- Work only on the selected artifact or assessment. This routine does not authorise attacks, deployment, publication or policy changes.

## Source and limits
- Read [SOURCES.md](SOURCES.md). Identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Conditional threat source. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the scenario's learning/inference stage, model type, data modality and assets.
2. Use evidence to describe the attacker's goal, access, capabilities and knowledge. Separate assumptions from observations.
3. Classify the relevant attack family, such as evasion, poisoning, privacy compromise or model extraction.
4. For generative systems, distinguish direct prompting, indirect prompt injection, supply-chain threats and agent-related threats.
5. Read the applicable taxonomy section and any publisher errata before assigning a precise classification.
6. Map the threat to the system's actual inputs, outputs, data, tools and trust boundaries.
7. Select mitigations for the identified capabilities. Document mitigation limits. One filter does not eliminate every attack class.
8. Design bounded defensive tests only in an authorised environment with protected test data.
9. Compare mitigated behaviour with baseline behaviour. Use a verifier that observes the threatened property.
10. Report the classification, evidence, assumptions, tested mitigations and residual risk. Do not declare the system attack-proof.

## Verify and recover
- **Worked check (illustrative, not executed):** A retrieved document contains instructions that try to change an agent's goal.
- **Expected:** Classify the indirect instruction channel. Inspect its authority boundary. Do not treat it as ordinary user intent.
- **If blocked:** If attacker access or the relevant learning/inference stage is unknown, stop the affected assessment or action. Record the missing prerequisite. Request it from the responsible owner. Continue only independent, authorised work.
- Keep facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths intact.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not remove requirements to improve a score or meet the line budget. Record unresolved source or task conflicts.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
