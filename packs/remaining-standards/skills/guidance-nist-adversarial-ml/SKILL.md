---
name: guidance-nist-adversarial-ml
description: "Classify an AI threat before selecting a defence."
---
# NIST AI 100-2e2025 adversarial ML taxonomy

## Task and boundary
- Analyse an adversarial-ML threat scenario for a specified AI system.
- Do not treat a taxonomy entry as exploit prevalence, an attack recipe or a probability estimate.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Conditional threat source. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the learning/inference stage, model type, data modality and assets in the scenario.
2. Describe the attacker's goal, access, capabilities and knowledge from evidence; distinguish assumptions from observations.
3. Classify the relevant attack family, such as evasion, poisoning, privacy compromise or model extraction.
4. For generative systems, distinguish direct prompting, indirect prompt injection, supply-chain and agent-related threats.
5. Read the applicable taxonomy section and any publisher errata before assigning a precise classification.
6. Map the threat to actual system inputs, outputs, data, tools and trust boundaries.
7. Select mitigations for those capabilities and document their limitations; one filter does not eliminate every attack class.
8. Design bounded defensive tests only in an authorised environment with protected test data.
9. Compare mitigated and baseline behaviour using a verifier that observes the threatened property.
10. Report classification, evidence, assumptions, tested mitigations and residual risk without declaring the system attack-proof.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** A retrieved document contains instructions that try to change an agent's goal.
- **Expected:** Classify the indirect instruction channel and inspect its authority boundary rather than calling it ordinary user
  intent.
- **Missing-evidence case:** Attacker access or the relevant learning/inference stage is unknown.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
