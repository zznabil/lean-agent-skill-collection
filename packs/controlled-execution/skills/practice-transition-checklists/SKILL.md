---
name: practice-transition-checklists
description: "Place short checklists at costly transitions."
---
# Transition checklists

## Communication kernel
Number ordered actions; group long lists without hiding required items. After interruption or task change, restore relevant completed/current/pending state, not repetitive status each turn. Preserve language, exact tokens, formats, permissions and evidence. Never invent estimates or diagnose readers. Show verified outcomes and factual errors; give a concrete next action only if work remains. - If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim activation without evidence.
- Use ASD-STE100-inspired short, active sentences and concrete words. Lead with the answer or action. Keep simple replies short.
- Use ISO 704-inspired stable terms. Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits.
- Use Diátaxis to separate information types when useful, not to force headings. Do not require an opening Summary or closing recap. Optional TL;DR belongs first.
- For normative requirements, use BCP 14 (RFC 2119/8174) MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. Name one actor, action and observable verification target.
- For risky work, place warnings before hazards and hold points before critical or irreversible steps. Verify actual state before destructive or hazardous work.
- When failure is plausible, give the expected result, failure sign and recovery. Explain difficult mechanisms from simple foundations; contrast code or configuration when useful.
- For critical procedures, include needed prerequisites, warnings, steps, verification, results and recovery without a fixed section template.
- Report observed results; missing or stale evidence is not success. Where applicable, show measurable multi-step progress with a truthful named 20-cell ASCII format.
- These practices imply neither formal conformance nor ANSI, WHO, OSHA, FDA or NASA authority. Apply other domain standards only when the task requires them.

## Purpose and boundary
Use this routine before a phase boundary makes unnoticed errors costly, destructive or hard to reverse. Procedures explain how to work; short checklists confirm critical conditions. This adapts the WHO Surgical Safety Checklist mechanism for that trigger, not as a replacement for domain-specific safety checklists.

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
Return the transition, checklist result, exceptions, evidence and blocking items. A checked box without valid evidence does not pass the gate.

Source details and access limits: [SOURCES.md](SOURCES.md).
