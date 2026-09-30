---
name: practice-transition-checklists
description: "Place short checklists at costly transitions."
---
# Transition checklists

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root `AGENTS.md` loads, its policy governs this skill. Otherwise you MUST apply this kernel as the fallback. Skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences. Lead with the main point and use familiar words. Keep simple replies short.
- Use ISO 704-inspired stable concepts and terminology. Keep each term tied to the same concept.
- Use Diátaxis organization. Separate how-to, reference and explanation when useful. These three principles are the default communication drivers, not formal standards conformance.
- Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits. Report observed results. Missing or stale evidence is not success.

## Conditional execution rules
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Preserve requirement force. Give each requirement one actor, one action and an observable verification target.
- For critical or risky work only, place warnings before hazards. Place hold points before critical or irreversible steps.
- Before destructive or hazardous work, verify actual state. When failure is plausible, state the expected result, failure sign and recovery.
- For difficult mechanisms, explain from simple foundations. When useful, contrast noncompliant and compliant code or configuration.
- For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful. Add contrast or TL;DR only when helpful.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.
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
