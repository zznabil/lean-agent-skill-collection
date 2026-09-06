# V8 to V9 migration

V9.0.1 is the first published V9 package. V9.0.0 below describes the unreleased consolidation candidate. V9.0.1 additionally restores scoped standards ownership and the compact standalone communication baseline; see [the repair design](V9.0.1-DESIGN.md).

V9.0.0 is a breaking consolidation: 23 routes become 17. No retired route is retained as an alias, because aliases would preserve discovery noise.

| Retired route | Current owner | Conditional detail |
|---|---|---|
| architecture | plan | ARCHITECTURE.md |
| grilling | plan | REQUIREMENTS.md |
| cli-design | implement | CLI.md |
| merge-conflicts | implement | MERGE-CONFLICTS.md |
| triage | debug | INCIDENT.md for active incidents |
| project-context | handoff | CONTEXT.md and AI-ASSET-CARDS.md |

Explicitly invoke the new owner and describe the task. The four remaining manual-only OpenAI routes are get-it-done, gauntlet-loop, handoff and wait-what. Other hosts may ignore that metadata; verify actual behaviour.

## Safe replacement

Locate the actual installed Lean profile and active host configuration. Back up local changes. Stage exactly one V9 profile and compare its contents with the old installation. Replace only that profile's Lean-owned files; remove the six retired Lean-owned skill directories after checking they contain no unrelated work. Do not delete the whole shared skills directory or overlay Complete on another installed profile.

Review the root AGENTS.md diff before incorporating it into trusted project or global instructions. Publication alone does not authorise or perform local installation. Keep host-specific policy and user instructions. The engineering supplement remains conditional; no skill requires a file available only in another profile.

Reload according to the host's documented mechanism and verify the source path, skill list and explicit invocation. Test a small representative task before replacing a working default profile. Retain the previous profile backup until the new setup is satisfactory.

## Behaviour and records

V9 removes compulsory Summary/TL;DR wrappers and progress bars as collection-wide defaults. A valid user preference can still request them. Correctness and evidence take priority over terse output. Four named scrutiny modes are replaced by direct proportional guidance; bounded long-task and adversarial procedures remain separately available.

Existing long-task and Gauntlet state files are historical records, not invalid files. On an authorised resume, preserve their authority, unresolved outcomes, evidence and exact checkpoint before using the smaller V9 format. Do not turn deferred work into completion during migration.

The source and generated package metadata use schema version 2. `passed`, `errors` and `skills_validated` pre-build claims are removed. Read build inventory from metadata and actual validation outcomes from the associated CI run. Consumers that expected those former keys must be updated.

Rollback means restore the reviewed previous profile and trusted-policy diff, then verify actual loaded files. Do not rewrite published tags or earlier release assets.
