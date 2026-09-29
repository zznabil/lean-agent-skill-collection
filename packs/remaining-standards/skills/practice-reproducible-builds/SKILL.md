---
name: practice-reproducible-builds
description: "Compare artifact bytes from independent equivalent builds."
---
# Reproducible Builds definition

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

## Task and boundary
- Test whether a specified build produces reproducible artifacts.
- Do not claim reproducibility from a successful rebuild, identical filenames or matching source revisions alone.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Strongly absorb. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Define the source, build instructions, relevant environment and exact output artifacts being compared.
2. Identify dependencies, toolchain versions, locale, timestamps, paths and other inputs that can influence bytes.
3. Run the build twice in the declared conditions, with independent clean output locations.
4. Record the actual environment and commands for each run, including any uncontrolled inputs.
5. Compare the intended distributable artifact bytes, not only an internal file or printed success message.
6. Use digests as comparisons of known bytes; inspect differences when outputs do not match.
7. Do not remove meaningful signatures, content or metadata after the fact just to manufacture equality.
8. If a normalization is part of the build specification, declare it before the experiment and compare its intended outputs.
9. Separate a same-environment repetition from reproduction by another party or environment.
10. Report the scope, exact outputs, equality result, variation sources and remaining uncontrolled conditions.

## Verify and recover
- **Worked check (illustrative, not executed):** Two ZIPs contain similar source files but differ in timestamps and archive bytes.
- **Expected:** Report the artifact mismatch; do not claim byte-reproducible release ZIPs.
- **If blocked:** A dependency is fetched from an unpinned mutable source. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
