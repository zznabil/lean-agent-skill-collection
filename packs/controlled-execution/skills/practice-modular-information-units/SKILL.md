---
name: practice-modular-information-units
description: "Design one bounded information job per module."
---
# Modular information units

## Communication kernel
If trusted root `AGENTS.md` loads, follow it; otherwise apply this standalone fallback. Do not claim root activation without evidence.
- **Brevity:** Use the fewest words that complete the task. Start with the answer, result or blocker. Remove filler, repeated conclusions, routine narration and decorative headings. Do not add a **Summary** heading or closing **TL;DR**. Use a leading **TL;DR** only when it improves a complex answer.
- **Language:** Use ASD-STE100-inspired short, active sentences and concrete verbs.
- **Terms:** Use ISO 704-inspired consistent terms: one preferred term per distinct concept. Define unfamiliar terms when needed; preserve exact technical and UI strings.
- **Structure:** Use Diátaxis to separate how-to, reference, explanation and tutorial content only when this helps navigation.
- **Integrity:** Preserve facts, actors, conditions, negation, exceptions, permissions, requirements, source rights, uncertainty, evidence, accessibility and the requested voice or format. Do not omit required details just to shorten text.
- **Safety and proof:** Use BCP 14 force only for normative rules. Keep warning-before-hazard, verified safe state, hold points, expected results, failure signs and recovery when relevant. Report actual test outcomes; do not invent a pass.
These are writing guides, not proof of standards conformance or host behaviour. Task-specific source rules still apply.
## Condition-triggered execution rules
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Preserve their force. State one actor, one action and an observable verification target.
- For critical or risky work only, place warnings before hazards. Place hold points before critical or irreversible steps. Before destructive or hazardous work, verify the actual state.
- When failure is plausible, state the expected result, failure sign and recovery.
- For difficult mechanisms, explain from simple foundations. When useful for code or configuration tasks, contrast noncompliant and compliant forms.
- For critical procedures, keep prerequisites, warnings, verified holds, actions, expected results and recovery; add headings only when useful.
- Give progress only when requested or useful. Keep progress distinct from the verdict.
- These execution rules do not transfer legal or organisational authority from ANSI, WHO, OSHA, FDA or NASA. Use other domain standards only when the task requires them. They are not default communication drivers.

## Purpose and boundary
Use this routine when separable information jobs need independent reuse or maintenance. Give each module one purpose and one completion boundary. Do not split one action across hidden dependencies. This routine does not create an S1000D-conformant data module or publication.

## Module record
Record the stable identifier/title, information job and intended user, type (descriptive, procedural or operational), trigger, inputs/dependencies, content, output/completion, owner/source/version and related modules/navigation.

## Steps
1. Identify the user's information job before you set module boundaries.
2. Separate modules when triggers, owners, evidence or reuse needs differ. Keep inseparable steps and recovery together.
3. Declare required dependencies. Do not rely on an absent root document. Make each module usable through its supported entry point.
4. Use stable identifiers so title changes do not break references. Keep source/version metadata with the module.
5. Test reuse from each intended host or package boundary. Merge units when navigation cost exceeds their independent value.
6. Keep cross-module rules consistent. Do not copy a canon that can then be edited independently.

## Worked distinction
**Mega-module:** One file mixes plain language, requirement quality, warnings, UI steps, recovery and verification for every task.

**Bounded modules:** Separate units for normative precision, safety messages, procedure rendering and verification, each with its selection condition.

## Verify and recover
Check that each module has one job, one entry condition and one completion condition. If a required dependency is absent at an intended entry point, stop that reuse path. Bundle the dependency or revise the boundary. Then retest. Return the module map and unresolved coupling.

For source details and access limits, see [SOURCES.md](SOURCES.md).
