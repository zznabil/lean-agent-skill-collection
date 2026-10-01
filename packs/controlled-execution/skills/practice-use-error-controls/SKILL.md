---
name: practice-use-error-controls
description: "Derive controls from foreseeable use errors."
---
# Use-error controls

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
Use this routine when a foreseeable user or agent error can cause material harm, loss or invalid evidence. Derive controls from the task and failure mechanism, not a generic warning list. This routine does not establish FDA compliance for a non-medical workflow.

## Task-risk record
Record the intended task and actor. Record the possible error, contributing circumstances and consequence. Record prevention, detection and containment, recovery, and evidence that the control works.

## Control order
Prefer `PREVENT` (remove the hazard, restrict capability or redesign). Then prefer `PROTECT` (interlock, guard, bounded permission or automatic check). Then use `INFORM` (instruction, warning or training). Information MAY support stronger controls. It MUST NOT silently replace an available effective design or protective control.

## Steps
1. Identify the point where the actor decides or changes state. List plausible errors and their contributing conditions.
2. State each direct consequence without exaggeration. Choose prevention before detection. Choose detection before warning-only control.
3. Set a stop condition before further progression. Give a route back to a known state before retry.
4. Test the selected control against the actual error path, not just the intended path. Record residual risk and untested assumptions.

## Worked distinction
**Task:** Delete generated build files.

**Error:** An ambiguous target path includes source files.

**Stronger control:** Grant delete permission only inside the generated-output directory.

**Additional gate:** Display and inspect the resolved deletion set before deletion.

**Weaker-only control:** “Be careful not to delete source files.”

## Verify and recover
If a high-consequence error has only a warning while a stronger feasible control remains unexplored, hold the task. Examine that control. If the error occurs, stop progression and contain it. Return to the recorded known state. Return the task-risk record, control level, test evidence and residual risk.

Source details and access limits: [SOURCES.md](SOURCES.md).
