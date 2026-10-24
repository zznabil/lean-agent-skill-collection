---
name: guidance-nist-adversarial-ml
description: "Classify an AI threat before selecting a defence."
---
# NIST AI 100-2e2025 adversarial ML taxonomy

## Communication kernel
Number ordered actions; group long lists without hiding required items. After interruption or task change, restore relevant completed/current/pending state, not repetitive status each turn. Preserve language, exact tokens, formats, permissions and evidence. Never invent estimates or diagnose readers. Show verified outcomes and factual errors; give a concrete next action only if work remains. - If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
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
- Analyse an adversarial-ML threat scenario for a specified AI system.
- Do not use a taxonomy entry as evidence of exploit prevalence, an attack recipe or a probability estimate.
- Work only on the selected artefact or assessment. This routine does not authorise attacks, deployment, publication or policy changes.

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
- Keep planned work, observed evidence and unknown results separate. Missing or stale evidence is not a pass.
- Do not remove requirements for a score or line budget. Record unresolved source or task conflicts.
- Use the smallest check that detects the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Make one correction pass and recheck affected evidence. If a required issue remains, report it; do not loop or claim completion.
- Return the scoped result, source edition, evidence, limits, unresolved requirements and next permitted action. Do not claim formal conformance or model-behaviour improvement from this routine.
