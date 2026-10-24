---
name: practice-modular-information-units
description: "Design one bounded information job per module."
---
# Modular information units

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
Use this routine for information jobs that need independent reuse or maintenance. Give each module one purpose and completion boundary. Do not split an action across hidden dependencies. This does not create an S1000D-conformant data module or publication.

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
Check each module's job, entry condition and completion condition. Stop reuse where a required dependency is absent. Bundle it or revise the boundary, then retest. Return the module map and unresolved coupling.

For source details and access limits, see [SOURCES.md](SOURCES.md).
