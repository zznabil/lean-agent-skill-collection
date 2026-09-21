---
name: practice-reproducible-builds
description: "Compare artifact bytes from independent equivalent builds."
---
# Reproducible Builds definition

## Task and boundary
- Test whether a specified build produces reproducible artifacts.
- Do not claim reproducibility from a successful rebuild, identical filenames or matching source revisions alone.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
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

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** Two ZIPs contain similar source files but differ in timestamps and archive bytes.
- **Expected:** Report the artifact mismatch; do not claim byte-reproducible release ZIPs.
- **Missing-evidence case:** A dependency is fetched from an unpinned mutable source.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
