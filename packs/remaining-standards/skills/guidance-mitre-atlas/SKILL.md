---
name: guidance-mitre-atlas
description: "Map AI threat evidence to applicable ATLAS techniques."
---
# MITRE ATLAS

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
- Use MITRE ATLAS to organise a defensive AI threat analysis or evaluation.
- Do not infer exploitability, frequency or system compromise solely from a matching technique name.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Conditional threat source. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Pin the ATLAS data or page revision used and identify the system and defensive question.
2. Map actual adversary goals and behaviours to relevant tactics and techniques.
3. Read the technique description, prerequisites and cited evidence rather than relying on its title.
4. Separate documented case-study evidence from hypothetical applicability to the current system.
5. Identify affected assets, attacker access and the concrete path through the system.
6. Map preventive, detective and recovery controls to each selected technique.
7. Design bounded defensive checks in an authorised environment; do not copy attack examples into live targets.
8. Capture exact technique IDs, evidence, test conditions and untested assumptions.
9. Review gaps and duplicate mappings without treating a larger technique count as a better assessment.
10. Report the scoped threat coverage and residual uncertainty; ATLAS is a living knowledge base, not a certification programme.

## Verify and recover
- **Worked check (illustrative, not executed):** A threat report lists an ATLAS technique without showing a reachable input or required attacker access.
- **Expected:** Treat applicability as unverified until the system path and prerequisites are supported.
- **If blocked:** The exact technique revision or its prerequisites cannot be established. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
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
