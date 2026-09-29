---
name: practice-use-error-controls
description: "Derive controls from foreseeable use errors."
---
# Use-error controls

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
Use when a foreseeable user or agent error can cause material harm, loss or invalid evidence. Derive controls from the task and failure mechanism, not a generic warning list. This routine does not establish FDA compliance for a non-medical workflow.

## Task-risk record
Record the intended task and actor, possible error, contributing circumstances, consequence, prevention, detection and containment, recovery, and evidence that the control works.

## Control order
Prefer `PREVENT` (remove the hazard, restrict capability or redesign), then `PROTECT` (interlock, guard, bounded permission or automatic check), then `INFORM` (instruction, warning or training). Information MAY support stronger controls. It MUST NOT silently replace an available effective design or protective control.

## Steps
1. Identify the point where the actor decides or changes state. List plausible errors and their contributing conditions.
2. State each direct consequence without exaggeration. Choose prevention before detection and detection before warning-only control.
3. Set a stop condition before further progression; give a route back to a known state before retry.
4. Test the selected control against the actual error path, not just the intended path. Record residual risk and untested assumptions.

## Worked distinction
**Task:** Delete generated build files.

**Error:** An ambiguous target path includes source files.

**Stronger control:** Grant delete permission only inside the generated-output directory.

**Additional gate:** Display and inspect the resolved deletion set before deletion.

**Weaker-only control:** “Be careful not to delete source files.”

## Verify and recover
If a high-consequence error has only a warning while a stronger feasible control remains unexplored, hold the task and examine that control. If the error occurs, stop progression, contain it and return to the recorded known state. Return the task-risk record, control level, test evidence and residual risk.

Source details and access limits: [SOURCES.md](SOURCES.md).
