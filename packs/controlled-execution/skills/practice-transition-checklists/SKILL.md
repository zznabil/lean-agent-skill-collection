---
name: practice-transition-checklists
description: "Place short checklists at costly transitions."
---
# Transition checklists

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
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Preserve requirement force. Give each requirement one actor, one action and an observable verification target.
- For critical or risky work only, place warnings before hazards. Place hold points before critical or irreversible steps.
- Before destructive or hazardous work, verify actual state. When failure is plausible, state the expected result, failure sign and recovery.
- For difficult mechanisms, explain from simple foundations. When useful, contrast noncompliant and compliant code or configuration.
- For critical procedures, keep prerequisites, warnings, verified holds, actions, expected results and recovery; add headings only when useful.
- Give progress only when requested or useful. Keep progress distinct from the verdict.
- These execution patterns do not transfer ANSI, WHO, OSHA, FDA or NASA legal or organisational authority. Use other domain standards only when the task requires them.

## Purpose and boundary
Use this routine at a phase boundary where an unnoticed error becomes costly, destructive or hard to reverse. A procedure tells the actor how to work. A short checklist confirms critical conditions. This routine uses the WHO Surgical Safety Checklist mechanism for this task trigger. It does not replace a domain-specific safety checklist.

## Design the gate
1. Name the transition (for example `prepare → change`, `edit → release` or `restore → close`). Name its coordinator or verifier.
2. Select only critical conditions that observation can answer. Write one condition per item. Name its evidence source and supplier.
3. Define which false or unknown answer stops progression. Keep the list executable at the transition. Review it after incidents or repeated false confirmations.

## Run the gate
1. Before crossing the boundary, have the named owner supply evidence for each item.
2. Have the verifier check the actual condition, not just discuss it. Record `Not applicable` only with a reason and authorised scope.
3. PAUSE when any required item is false, unknown or unsupported. Correct the condition and obtain fresh evidence. Run the blocked item again before proceeding.

## Checklist item form
`[ ] CONDITION — EVIDENCE — OWNER`. A checked box means that someone observed the condition. Keep the supporting evidence.

## Worked gate
**EDIT PHASE → RELEASE PHASE**
- `[ ] Intended files only — inspected diff — worker`
- `[ ] Required tests executed — command and exit code — worker`
- `[ ] Required tests passed — result record — verifier`
- `[ ] Recovery path available — rollback reference — release owner`

Any false or unknown required item stops the transition. The checklist MUST NOT become a 40-step duplicate of the procedure. Do not check an item in advance. Do not infer it from role seniority.

## Verify
Return the transition, checklist result, exceptions, supporting evidence and blocking items. A completed box without valid evidence does not pass the gate.

Source details and access limits: [SOURCES.md](SOURCES.md).
