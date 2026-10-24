---
name: guidance-mitre-atlas
description: "Map AI threat evidence to applicable ATLAS techniques."
---
# MITRE ATLAS

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
- Use MITRE ATLAS to organise a defensive AI threat analysis or evaluation.
- Do not infer exploitability, frequency or system compromise from a matching technique name alone.
- Work only on the selected artefact or assessment. This routine grants no permission to run attacks, deploy, publish or change policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) to identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot provide missing requirements or prove conformance.
- Historical adoption decision: Conditional threat source. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Pin the ATLAS data or page revision used. Identify the system and defensive question.
2. Map actual adversary goals and behaviours to relevant tactics and techniques.
3. Read the technique description, prerequisites and cited evidence. Do not rely on its title.
4. Distinguish documented case-study evidence from hypothetical applicability to the current system.
5. Identify affected assets, attacker access and the concrete path through the system.
6. Map preventive, detective and recovery controls to each selected technique.
7. Design bounded defensive checks in an authorised environment. Do not copy attack examples into live targets.
8. Record exact technique IDs, evidence, test conditions and untested assumptions.
9. Review gaps and duplicate mappings. Do not treat a larger technique count as a better assessment.
10. Report threat coverage within the selected scope and residual uncertainty. ATLAS is a living knowledge base, not a certification programme.

## Verify and recover
- **Worked check (illustrative, not executed):** A threat report lists an ATLAS technique without showing a reachable input or required attacker access.
- **Expected:** Treat applicability as unverified until evidence supports the system path and prerequisites.
- **If blocked:** If you cannot establish the exact technique revision or its prerequisites, stop the affected assessment or action. Record the missing prerequisite and request it from the responsible owner. Continue only independent, authorised work.
- Keep planned work, observed evidence and unknown results separate. Missing or stale evidence is not a pass.
- Do not remove requirements for a score or line budget. Record unresolved source or task conflicts.
- Use the smallest check that detects the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Make one correction pass and recheck affected evidence. If a required issue remains, report it; do not loop or claim completion.
- Return the scoped result, source edition, evidence, limits, unresolved requirements and next permitted action. Do not claim formal conformance or model-behaviour improvement from this routine.
