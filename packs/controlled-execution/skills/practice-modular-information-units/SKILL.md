---
name: practice-modular-information-units
description: "Design one bounded information job per module."
---
# Modular information units

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
Use when separable information jobs need independent reuse or maintenance. Give each module one purpose and completion boundary; do not split one action across hidden dependencies. This routine does not create an S1000D-conformant data module or publication.

## Module record
Record stable identifier/title, information job and intended user, type (descriptive, procedural or operational), trigger, inputs/dependencies, content, output/completion, owner/source/version and related modules/navigation.

## Steps
1. Identify the user's information job before drawing module boundaries.
2. Separate modules when triggers, owners, evidence or reuse needs differ. Keep inseparable steps and recovery together.
3. Declare required dependencies; do not rely on an absent root document. Make each module usable through its supported entry point.
4. Use stable identifiers so title changes do not break references. Keep source/version metadata with the module.
5. Test reuse from each intended host or package boundary. Merge units when navigation cost exceeds independent value.
6. Keep cross-module rules consistent without copying an independently editable canon.

## Worked distinction
**Mega-module:** One file mixes plain language, requirement quality, warnings, UI steps, recovery and verification for every task.

**Bounded modules:** Separate units for normative precision, safety messages, procedure rendering and verification, each with its selection condition.

## Verify and recover
Check one job, entry condition and completion condition per module. If a required dependency is absent at an intended entry point, stop that reuse path; bundle the dependency or revise the boundary, then retest. Return the module map and unresolved coupling.

Source details and access limits: [SOURCES.md](SOURCES.md).
