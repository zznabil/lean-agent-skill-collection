# Lean Agent Skill Collection

[![Version](https://img.shields.io/badge/version-v8.9.0-2563eb)](CHANGELOG.md)
[![Skills](https://img.shields.io/badge/skills-23-0f766e)](skills)
[![Validation](https://github.com/zznabil/lean-agent-skill-collection/actions/workflows/validate.yml/badge.svg)](https://github.com/zznabil/lean-agent-skill-collection/actions/workflows/validate.yml)

A compact, source-browsable collection of 23 vendor-neutral agent skills for engineering, research, communication, documents, experiments, and quality work. OpenAI-specific metadata lives in thin adapters beside each skill.

> **AI provenance and review warning:** The collection decisions were heavily assisted by GPT-5.6 Sol Pro. Model involvement is not evidence of quality or correctness. Treat every skill as untrusted policy until you have reviewed it and tested it in your own host and project.

V8.9.0 integrates all 27 supplemental user-facing routines into six generated profiles while preserving the unchanged 23 base task skills and base routing. Each profile carries zero supplemental adapters, explicit rights and public-source limitations, and effective totals of 35, 46, 50, 30, 32, and 31.

V8.7 adds **direct claims and accountable reporting** to every profile: state the supported result and actor plainly, retain genuine uncertainty, and give the next safe action. It does not ban all negation or hedging. See the [scoped decision and sources](docs/DIRECT-CLAIMS-REVIEW-v8.7.0.md).

## V8.9.0: integrated user-facing standards

The canonical supplemental pack is now the integrated source for all six generated profiles. The 23 base task skills, existing adapters and routing remain unchanged; the 27 supplemental routines add no adapters and do not claim complete formal standards or live-model evidence. Read the [integrated release notes](releases/v8.9.0/RELEASE-NOTES-v8.9.0.md), [supplemental pack](packs/user-facing-standards/README.md), and [rights notice](packs/user-facing-standards/THIRD-PARTY-NOTICES.md) before redistribution.

## V8.8.0: explicit instructions, clearer prose

The rewrite preserves the V8.7 rules, reference files, standards-register decisions, workflow states, skill descriptions and adapter policies. Dense instruction blocks are segmented without deleting their conditions or exceptions. New authoring guidance applies writing, wait-what and teach principles to instructions for people and agents; it does not impose lessons or extra skill loading on ordinary tasks.

Read the [design and preservation boundary](docs/PROSE-CLARITY-v8.8.0.md). The new check reconstructs each original instruction file after removing declared layout and additions; four explicitly documented instruction-authoring rules are clarified. This is a textual guarantee, not a live-agent performance claim. Existing historical metadata is retained for compatibility and is not fresh validation evidence. Use the exact CI run for execution results.

## Start here

Choose one profile. Do not install overlapping profiles together.

| Profile | Base | Supplemental | Total | Best for | Generated package |
|---|---:|---:|---:|---|---|
| Core | 8 | 27 | 35 | Planning, research, review, and long-running work | `lean-agent-skills-core-openai-v8.9.0.zip` |
| Engineering | 19 | 27 | 46 | Software delivery and engineering operations | `lean-agent-skills-engineering-openai-v8.9.0.zip` |
| Complete | 23 | 27 | 50 | The full collection | `lean-agent-skills-complete-openai-v8.9.0.zip` |
| Communication | 3 | 27 | 30 | Clear replies, teaching, writing, and user information | `user-facing-communication-mini-openai-v8.9.0.zip` |
| Get It Done | 5 | 27 | 32 | Long-horizon execution and acceptance | `get-it-done-pack-openai-v8.9.0.zip` |
| Gauntlet Loop | 4 | 27 | 31 | High-risk adversarial review | `gauntlet-loop-pack-openai-v8.9.0.zip` |

The Get It Done and Gauntlet packs each include the full Communication trio. `wait-what` is included once through set union, not duplicated.

Browse the [skill catalog](docs/SKILL-CATALOG.md) before choosing a profile.

## Install

Install one profile ZIP as a skills-only plugin where your host supports it. Otherwise, extract one package and copy its `skills/` directories into the user-level or repository-level skill directory used by your agent host.

Each package follows this layout:

```text
.codex-plugin/plugin.json
AGENTS.md
ENGINEERING-CORE.md (profiles that include engineering core)
THIRD_PARTY_NOTICES.md
USER-FACING-STANDARDS-NOTICES.md
skills/<task-skill>/SKILL.md
skills/<task-skill>/agents/openai.yaml
skills/<supplemental-skill>/SKILL.md
skills/<supplemental-skill>/SOURCES.md
skills/<supplemental-skill>/references/<source>
```

The task-skill SKILL.md files are vendor-neutral and retain their original adapters and routing. Supplemental standards are sourced from the canonical pack and carry SOURCES.md/references without adapters.

## Repository layout

```text
skills/                       Canonical source for 23 base task skills
.codex-plugin/                Root plugin for the 23 base skills and adapters
docs/                         Catalog, audits, history, standards, and evaluations
packs/user-facing-standards/ Canonical source for 27 supplemental standards
dist/v7.2/                    Historical V7.2.0 release snapshot
release-profiles.json         Canonical version and six profile inventories
scripts/build-release.ps1     Deterministic release builder
scripts/validate.ps1          Static source and release integrity checks
UPSTREAM-CHECKSUMS.sha256     Canonical source hashes used by validation
```

## Validate

On PowerShell 7 or Windows PowerShell 5.1:

```powershell
./scripts/build-release.ps1
./scripts/test-validator.ps1 -ArtifactsDirectory ./artifacts/v8.9.0
./scripts/test-prose-preservation.ps1 -ArtifactsDirectory ./artifacts/v8.9.0
./scripts/validate.ps1 -ArtifactsDirectory ./artifacts/v8.9.0
./scripts/audit-repository.ps1 -ArtifactsDirectory ./artifacts/v8.9.0
```

The builder produces all six profiles and a master archive with fixed entry order and timestamps. The validators check metadata, profile inventories, licensing, source hashes, user-facing and considerate-agency contracts, human-usable information, evaluation mirrors, package checksums, text hygiene, temporary scaffolds, duplicate and case-colliding ZIP members, traversal, symlinks, executables, local links, placeholders, and common secret patterns. They do not install or execute any skill.

## Design principles

- Match reply length and structure to the task. Investigate deeply enough to justify the claim, then report only the useful outcome, fresh verification, material uncertainty, and remaining action.
- Use the minimum sufficient scrutiny that can prove the outcome; small work stays small, and every extra check or agent must close a distinct evidence gap.
- When tools can safely complete the task, act rather than return instructions; a stated intent must end in execution or a plain blocker.
- Evidence before claims. Acceptance oracles must observe the named outcome and fail honestly under a representative broken state.
- Explicit permission boundaries for consequential actions.
- Small skills with narrow triggers instead of one broad controller.
- Durable state only when work can outlive a session.
- Standards are named in their owning skills but applied only when relevant.
- User information is judged by findability, understanding, action, recovery, and real task evidence—not readability alone.
- Static validation is not proof of live routing, user comprehension, accessibility conformance, or formal standards conformance.

See the [release audit](docs/AUDIT.md) and [repository-integrity audit](docs/REPOSITORY-AUDIT.md) for findings, limits, and package relationships. [`PACKAGE-VALIDATION.json`](PACKAGE-VALIDATION.json) covers static source and package structure only; it is not a runtime-quality, usability, accessibility, or standards-conformance claim.

## Release integrity

The V8.9.0 release preserves the restored V8.7.0 architecture while integrating the canonical 27-routine user-facing pack into every generated profile. Release packages are reproducibly generated from the versioned source and include SHA-256 inventories, a manifest, validation records, the license, notices, six profiles, and a master archive. The committed [dist/v7.2](dist/v7.2) directory remains a historical V7.2.0 snapshot; new binary builds are not accumulated on main.

## Security

Treat skills and workflow instructions as executable policy. Review them before installation. Do not auto-update or run untrusted hooks or installers. See [SECURITY.md](SECURITY.md).

## License

MIT. See [LICENSE](LICENSE).

Legally reused or adapted material is documented in [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md). Conceptual inspiration and research lineage are documented in [docs/HISTORY.md](docs/HISTORY.md) and [docs/STANDARDS-REGISTER.md](docs/STANDARDS-REGISTER.md).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for validation and change requirements.

## Canonical supplemental standards

The [user-facing standards pack](packs/user-facing-standards/README.md) is the canonical source for 27 supplemental user-facing standards. Every generated profile adds all 27 without OpenAI adapters, for effective totals of 35, 46, 50, 30, 32, and 31; the release-wide unique skill count is 50. The root skills/ tree and root .codex-plugin remain the 23 base task skills with their existing adapters and routing.

Review the [supplemental catalog](packs/user-facing-standards/CATALOG.md) and [supplemental rights notice](packs/user-facing-standards/THIRD-PARTY-NOTICES.md) before redistribution. These are scoped application aids, not complete formal standards or conformance evidence; publisher documents retain their own terms and are not relicensed by repository MIT.
