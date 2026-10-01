---
name: practice-reproducible-builds
description: "Compare artifact bytes from independent equivalent builds."
---
# Reproducible Builds definition

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root `AGENTS.md` is loaded, its policy governs this skill. Skill-specific rules refine the kernel. Without that root policy, you MUST apply this kernel. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences. Lead with the main point and familiar words. Use ISO 704-inspired stable concepts and terminology. Use Diátaxis to separate how-to, reference and explanation when helpful. Keep simple replies short.
- Preserve requirement force, actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits. Keep normative MUST, MUST NOT, SHOULD, SHOULD NOT and MAY meanings unchanged. State the actor, action and observable verification target for each requirement.
- These are communication patterns, not formal standards conformance or transferred legal or organisational authority. Use other domain standards only when the task requires them.

## Conditional execution controls
- For critical or risky work, place warnings before hazards and hold points before critical or irreversible steps. Before destructive or hazardous work, verify the actual state.
- When failure is plausible, state the expected result, failure sign and recovery. For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful.
- For difficult mechanisms, explain from simple foundations. Contrast noncompliant and compliant code or configuration when useful. Add a contrast or TL;DR only when helpful.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable. Report observed results. Missing or stale evidence is not success.

## Task and boundary
- Test whether the specified build produces reproducible artifacts.
- Do not claim reproducibility based only on a successful rebuild, identical filenames or matching source revisions.
- Limit work to the selected artifact or assessment. This routine grants no permission to run attacks, deploy, publish or change policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) to identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Strongly absorb. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Specify the source, build instructions, relevant environment and exact output artifacts for comparison.
2. Identify dependencies, toolchain versions, locale, timestamps, paths and other inputs that can affect bytes.
3. Run the build twice under the declared conditions. Use independent clean output locations.
4. Record each run's actual environment and commands. Include uncontrolled inputs.
5. Compare the intended distributable artifact bytes. Do not compare only an internal file or printed success message.
6. Use digests to compare known bytes. Inspect differences if outputs do not match.
7. Do not remove meaningful signatures, content or metadata after the build just to create equality.
8. If the build specification includes normalization, declare it before the experiment. Compare its intended outputs.
9. Distinguish repetition in the same environment from reproduction by another party or in another environment.
10. Report the scope, exact outputs, equality result, sources of variation and remaining uncontrolled conditions.

## Verify and recover
- **Worked check (illustrative, not executed):** Two ZIPs contain similar source files but differ in timestamps and archive bytes.
- **Expected:** Report the artifact mismatch; do not claim byte-reproducible release ZIPs.
- **If blocked:** If a dependency comes from an unpinned mutable source, stop the affected assessment or action. Record the missing prerequisite and request it from the responsible owner. Continue only independent, authorised work.
- Keep facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths intact.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not remove requirements to improve a score or meet the line budget. Record any unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the result for the selected scope, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck the affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
