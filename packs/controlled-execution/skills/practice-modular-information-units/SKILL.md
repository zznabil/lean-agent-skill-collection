---
name: practice-modular-information-units
description: "Design one bounded information job per module."
---
# Modular information units

## Use and boundary
- Use when a large instruction set contains separable information jobs that need independent reuse or maintenance.
- Give each module one defined purpose and completion boundary.
- Do not split content so finely that readers must reconstruct one action from many hidden dependencies.
- This routine does not create an S1000D-conformant data module or publication.

## Module record
Record:
- stable identifier and title;
- information job and intended user;
- type, such as descriptive, procedural or operational;
- trigger or entry condition;
- inputs and dependencies;
- contained instructions or information;
- output or completion condition;
- owner, source and version;
- related modules and navigation.

## Procedure
1. Identify the user's information job before selecting module boundaries.
2. Separate modules when they have different triggers, owners, evidence or reuse needs.
3. Keep inseparable steps and their recovery together.
4. Declare every required dependency; do not rely on an absent root document.
5. Make the module understandable when loaded through its supported entry point.
6. Use stable identifiers so references survive title changes.
7. Keep source and version metadata with the module.
8. Test reuse from each intended host or package boundary.
9. Merge modules whose separation creates navigation cost without independent value.
10. Keep cross-module rules consistent without copying an independently editable canon.

## Worked distinction
**Mega-module:** One file mixes plain language, requirement quality, warnings, UI steps, recovery and verification for every task.

**Bounded modules:** Separate reusable units for normative precision, safety messages, procedure rendering and verification, with declared selection conditions.

## Finish and stop
- Verify one information job, one clear entry condition and one completion condition per module.
- Stop if a required dependency is unavailable at an intended entry point.
- Return the module map and unresolved coupling.

Source details and access limits: [SOURCES.md](SOURCES.md).
