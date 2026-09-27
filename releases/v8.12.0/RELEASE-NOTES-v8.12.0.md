# V8.12.0 — Profile-aware Agent Instructions

## Changes

- Redesign `AGENTS.md` around an always-active communication kernel, explicit standards by task, action and evidence boundaries, and a task map for 24 base skills and 27 supplemental routines.
- Generate a profile-specific `AGENTS.md` in each of the six release ZIPs. Each map lists only that profile's base skills plus all 27 supplemental routines; routing and profile membership do not change.
- Validate the root map against source inventories and each packaged map against its profile, including a rehashed missing-entry rejection control. Read the UTF-8 policy consistently on PowerShell 7 and Windows PowerShell 5.1.
- Refine the fixed communication evaluation rubric for reset-link sequence and required security release gates. A saved trace rescored after a matcher correction is not a new model run.

## Install and limits

Choose one profile. Merge its `AGENTS.md` into the trusted project root and configure the host to load its `skills/` directory; a skills-only plugin install does not activate the root instructions by itself. Do not install overlapping profiles together.

The remaining-standards and controlled-execution packs remain source-only and excluded from these release profiles. Supplemental references retain their own licensing and source-access limits; read the included notices before redistribution. Static checks and package integrity do not prove live host routing, user comprehension, security, accessibility or formal standards conformance. No new live communication result is claimed for this release.
