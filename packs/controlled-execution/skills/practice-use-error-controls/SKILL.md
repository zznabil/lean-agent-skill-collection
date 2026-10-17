---
name: practice-use-error-controls
description: "Derive controls from foreseeable use errors."
---
# Use-error controls

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim activation without evidence.
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
Use this routine when foreseeable user or agent errors can cause material harm, loss or invalid evidence. Derive controls from tasks and failure mechanisms, not generic warnings. This does not establish FDA compliance for non-medical workflows.

## Task-risk record
Record the intended task, actor, possible error, contributing circumstances and consequence. Include prevention, detection, containment, recovery and evidence that the control works.

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
Hold high-consequence tasks with warning-only controls until stronger feasible controls have been examined. If an error occurs, stop progression, contain it and return to the recorded known state. Return the task-risk record, control level, test evidence and residual risk.

Source details and access limits: [SOURCES.md](SOURCES.md).
