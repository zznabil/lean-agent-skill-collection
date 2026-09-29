---
name: practice-transition-checklists
description: "Place short checklists at costly transitions."
---
# Transition checklists

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

## Purpose and boundary
Use at a phase boundary where an unnoticed error becomes costly, destructive or hard to reverse. A procedure tells the actor how to work; a short checklist confirms critical conditions. This routine does not replace a domain-specific safety checklist.

## Design the gate
1. Name the transition (for example `prepare → change`, `edit → release` or `restore → close`) and its coordinator or verifier.
2. Select only critical conditions answerable from observation. Write one condition per item and name its evidence source and supplier.
3. Define which false or unknown answer stops progression. Keep the list executable at the transition; review it after incidents or repeated false confirmations.

## Run the gate
1. Before crossing the boundary, have the named owner supply evidence for each item.
2. Have the verifier check the actual condition, not just discuss it. Record `Not applicable` only with a reason and authorised scope.
3. PAUSE when any required item is false, unknown or unsupported. Correct the condition, obtain fresh evidence and run the blocked item again before proceeding.

## Checklist item form
`[ ] CONDITION — EVIDENCE — OWNER`. A checked box means the condition was observed. Keep the supporting evidence.

## Worked gate
**EDIT PHASE → RELEASE PHASE**
- `[ ] Intended files only — inspected diff — worker`
- `[ ] Required tests executed — command and exit code — worker`
- `[ ] Required tests passed — result record — verifier`
- `[ ] Recovery path available — rollback reference — release owner`

Any false or unknown required item stops the transition. The checklist MUST NOT become a 40-step duplicate of the procedure. Do not check an item in advance or infer it from role seniority.

## Verify
Return the transition, checklist result, exceptions, supporting evidence and blocking items. A completed box without valid evidence is not a passed gate.

Source details and access limits: [SOURCES.md](SOURCES.md).
