# V8.8.0 — Explicit Instructions, Clearer Prose

## Changes

Preserve the restored V8.7 architecture: 23 skills, six profiles, source references, standards-register decisions, workflow states, invocation policies and standalone communication coverage. All skill roots and global/core instructions are segmented for easier reading without removing their explicit contracts. Writing, wait-what, teach and skill-design now address agent-facing instruction clarity as well as user-facing prose.

Four skill-design rules are clarified: merging is a behavioural change, reference loading must preserve availability, required resources are not clutter, and fewer words must preserve the complete contract. Instruction authoring now makes the actor, trigger, action, evidence, exception and recovery explicit, and flags ambiguity the source cannot resolve. It does not force every task into a tutorial or require three skills to load.

## Preservation and verification

The new pinned reconstruction check covers all 25 instruction roots. It separately protects frontmatter, ordered-step numbers and literal code examples; freezes existing references, adapters, register and historical records; and checks each package's exact source bytes and checksum inventory. Deliberately damaged source/package controls must fail. All legacy V8.7 gates remain enabled on PowerShell 7 and Windows PowerShell 5.1.

These checks establish textual and distribution properties, not live-agent performance, comprehension or standards conformance. Live model comparisons remain unrun. Actual CI and publication readback, rather than generated metadata, provide execution evidence.

## Upgrade and recovery

Use one profile per installation scope. There is no V8.7 route retirement or profile-composition migration. Back up local changes and review AGENTS.md before replacing trusted instructions. Users of the historical V9 package should stage the desired V8.8 profile separately and inspect its 23-skill inventory rather than blindly overlaying files. Verify actual host-loaded paths; publication does not update your installation.

Retain a known-working profile for rollback. Keep earlier tags and release assets unchanged. Follow the repository's existing protected PR, exact-main CI, annotated-tag, draft-download and public-download verification procedure for any publication.
