# Lean Agent Skill Collection

[![Version](https://img.shields.io/badge/version-v8.15.0-2563eb)](CHANGELOG.md)
[![Base skills](https://img.shields.io/badge/base_skills-24-0f766e)](skills)
[![Validation](https://github.com/zznabil/lean-agent-skill-collection/actions/workflows/validate.yml/badge.svg)](https://github.com/zznabil/lean-agent-skill-collection/actions/workflows/validate.yml)

A compact, source-browsable collection of 24 vendor-neutral agent skills for engineering, research, communication, documents, experiments, fast-path delivery, and quality work. OpenAI-specific metadata lives in thin adapters beside each skill.

> **AI provenance and review warning:** The collection decisions were heavily assisted by GPT-5.6 Sol Pro. Model involvement is not evidence of quality or correctness. Treat every skill as untrusted policy until you have reviewed it and tested it in your own host and project.

V8.15.0 rewrites all 134 skills, live authored companion resources, adapter prompts, and root policy around the three-driver communication kernel. Task-specific safety, permissions, evidence, routing, and source rights remain intact. Read the [release notes](releases/v8.15.0/RELEASE-NOTES-v8.15.0.md).

V8.14.0 adds a manually invoked **Task Brief / Context Preflight** mode to the existing `project-context` skill. Direct, Standard, and Durable records identify minimum sufficient context, evidence provenance, readiness, and the next action; a brief does not prove execution. Read the [release notes](releases/v8.14.0/RELEASE-NOTES-v8.14.0.md) and [schema](skills/project-context/TASK-BRIEF.md).

The root `AGENTS.md` governs the 24 base skills, 27 integrated supplemental skills, and selected routines from both optional source packs when loaded; each independently loaded skill has a local lean fallback. Each generated profile includes only its base-skill rows plus the shared supplemental map. The two source-only packs retain their separate catalogs and are not release-profile inputs. The repository audit enforces fewer than 100 root-policy lines.

The default communication kernel has three drivers: **ASD-STE100-inspired language**, **ISO 704-inspired terminology**, and **Diátaxis organization**. It applies to task instructions and live authored companion resources, not just standalone fallback paragraphs. Other frameworks remain task-selected. Safety, permissions, normative force, source rights, and evidence requirements still apply when their task conditions are met.

Vale checks the live authored corpus and blocks terminology errors; sentence-length warnings remain advisory. Routing front matter and code-formatted identifiers are not prose lint targets. Run `scripts/test-vale.ps1 -ValePath <vale-executable>` to exercise canonical source names, rejected terminology, and nonblocking sentence warnings. Structural checks and lint are not proof of host activation, model performance, or formal standards conformance.

V8.13.0 rewrites each skill’s task instructions—not only its standalone fallback—to lead with the outcome, order actions around applicable prerequisites and holds, and distinguish observed evidence from unverified claims. The root policy and generated profile instructions carry the same kernel across the full task journey. Optional packs remain separate, selected by task and source rights.

Skills-only and manually copied pack installations use local kernel fallbacks; a host must actually load trusted root `AGENTS.md` for the full collection policy. ISO 24495-1 and W3C COGA apply to named communication friction, not every sentence. The strengthened OMP rubric checks password-reset sequence and explicit security release decisions; live-host results belong in release evidence, not a static validation claim. No formal conformance is claimed.

V8.9.0 integrates all 27 supplemental user-facing routines into six generated profiles while preserving the base routes and zero supplemental adapters. Effective profile totals were 35, 46, 50, 30, 32, and 31. Read the [integrated release notes](releases/v8.9.0/RELEASE-NOTES-v8.9.0.md), [supplemental pack](packs/user-facing-standards/README.md), and [rights notice](packs/user-facing-standards/THIRD-PARTY-NOTICES.md) before redistribution.

V8.8.0 preserves all earlier 23 skills and six profiles. It retains outcome-first communication and quiet execution: match reply length to the task, investigate enough internally, act instead of merely promising, and report outcome, verification, and remaining action without replaying routine process. Read the [Hermes prompt review](docs/HERMES-PROMPT-REVIEW-v8.6.0.md), [Hermes integration guide](docs/HERMES-INTEGRATION.md), [minimum-scrutiny review](docs/MINIMUM-SCRUTINY-REVIEW-v8.5.0.md), and [repository audit](docs/REPOSITORY-AUDIT.md).

V8.7 adds **direct claims and accountable reporting** to every profile: state the supported result and actor plainly, retain genuine uncertainty, and give the next safe action. It does not ban all negation or hedging. See the [scoped decision and sources](docs/DIRECT-CLAIMS-REVIEW-v8.7.0.md).

## V8.10.1: Quick Mode metadata repair

Quick Mode can be selected from natural language only after an explicit user request. It does not activate for “quick question”, a request for a short answer, or a duration estimate. The user must explicitly select Quick Mode, a rough prototype, or an equivalent reduced acceptance scope.

The default route is:

```text
define one working slice
→ inspect only what is needed
→ build the smallest useful end-to-end result
→ run one cheap smoke check
→ report evidence and deferrals
→ stop
```

Quick Mode does not waive authorisation, destructive-action safeguards, data integrity, required security, compatibility, accessibility, or honest evidence status. Production readiness is `NOT ASSESSED` unless a later hardening task establishes it.

When dogfooding is selected, the agent must use an appropriate tool to operate the actual running project through its intended interface. When automated UAT is selected, the agent must run or create one replayable user journey with a real assertion. Source inspection, compilation alone, unit tests alone, or an uninteracted screenshot do not satisfy those selected modes.

The V8.8 textual baseline is historical for this revision. Current validation preserves package bytes, inventories, licensing boundaries, skill routing, and source hashes while allowing deliberate communication-prose edits; live quality is checked against the fixed OMP corpus.

## Start here

Choose one profile. Do not install overlapping profiles together.

| Profile | Base | Supplemental | Total | Best for | Generated package |
|---|---:|---:|---:|---|---|
| Core | 9 | 27 | 36 | Planning, research, review, Quick Mode, and long-running work | `lean-agent-skills-core-openai-v8.15.0.zip` |
| Engineering | 20 | 27 | 47 | Software delivery, Quick Mode, and engineering operations | `lean-agent-skills-engineering-openai-v8.15.0.zip` |
| Complete | 24 | 27 | 51 | The full collection | `lean-agent-skills-complete-openai-v8.15.0.zip` |
| Communication | 3 | 27 | 30 | Clear replies, teaching, writing, and user information | `user-facing-communication-mini-openai-v8.15.0.zip` |
| Get It Done | 6 | 27 | 33 | Quick and long-horizon execution, acceptance, and complete communication support | `get-it-done-pack-openai-v8.15.0.zip` |
| Gauntlet Loop | 4 | 27 | 31 | High-risk adversarial review with complete communication support | `gauntlet-loop-pack-openai-v8.15.0.zip` |

The Get It Done and Gauntlet packs each include the full Communication trio. `wait-what` is included once through set union, not duplicated. Quick Mode is included in Core, Engineering, Complete, and Get It Done only.

Browse the [skill catalogue](docs/SKILL-CATALOG.md) before choosing a profile.

## Install

Extract one profile ZIP. Put its `AGENTS.md` in the trusted project root (merge with existing instructions; do not overwrite them), and configure your agent host to load the extracted `skills/` directory. A skills-only plugin install does not activate the `AGENTS.md` communication kernel by itself.

Each package follows this layout:

```text
.codex-plugin/plugin.json
AGENTS.md
ENGINEERING-CORE.md (profiles that include engineering core)
skills/<skill>/SKILL.md
skills/<skill>/agents/openai.yaml
```

The `SKILL.md` files are vendor-neutral. Hosts other than ChatGPT or Codex can ignore `agents/openai.yaml`.

## Repository layout

```text
skills/                       Canonical source for all 24 base task skills
packs/user-facing-standards/ Canonical source for 27 supplemental standards
packs/remaining-standards/ Source-only pack; excluded from generated profiles
packs/controlled-execution/ Source-only pack; excluded from generated profiles
.codex-plugin/                Complete-profile plugin manifest
docs/                         Catalogue, audits, history, standards, and evaluations
dist/v7.2/                    Historical V7.2.0 release snapshot
release-profiles.json         Canonical version and six profile inventories
scripts/build-release.ps1     Deterministic release builder
scripts/validate.ps1          Static source and release integrity checks
scripts/audit-repository.ps1  Cross-file repository consistency checks
UPSTREAM-CHECKSUMS.sha256     Canonical source hashes used by validation
```

## Validate

On PowerShell 7 or Windows PowerShell 5.1:

```powershell
./scripts/build-release.ps1 -OutputDirectory ./artifacts/v8.15.0
./scripts/test-validator.ps1 -ArtifactsDirectory ./artifacts/v8.15.0
./scripts/test-prose-preservation.ps1 -ArtifactsDirectory ./artifacts/v8.15.0
./scripts/validate.ps1 -ArtifactsDirectory ./artifacts/v8.15.0
./scripts/audit-repository.ps1 -ArtifactsDirectory ./artifacts/v8.15.0
```

For an optional live communication check, install the OMP CLI, then run `python scripts/evaluate-communications.py --package ./artifacts/v8.15.0/user-facing-communication-mini-openai-v8.15.0.zip --out ./artifacts/communication-live`. The runner records each case and trace; its score applies only to the fixed prompts and current generated package.

The builder produces all six profiles and a master archive with fixed entry order and timestamps. Supplemental standards carry their own rights notice and are not relicensed by the repository MIT license. The validators check metadata, profile inventories, licensing, source hashes, user-facing and considerate-agency contracts, Quick Mode routing and validation-mode contracts, human-usable information, evaluation mirrors, package checksums, text hygiene, temporary scaffolds, duplicate and case-colliding ZIP members, traversal, symlinks, executables, local links, placeholders, and common secret patterns. They do not install or execute any skill or interaction tool.

## Design principles

- Match reply length and structure to the task. Investigate deeply enough to justify the claim, then report only the useful outcome, fresh verification, material uncertainty, and remaining action.
- Use the minimum sufficient scrutiny that can prove the outcome; small work stays small, and every extra check or agent must close a distinct evidence gap.
- Quick Mode is a user-authorised explicit-request route for a reduced working slice, not an automatically selected low-scrutiny route.
- When tools can safely complete the task, act rather than return instructions; a stated intent must end in execution or a plain blocker.
- Evidence before claims. Acceptance oracles must observe the named outcome and fail honestly under a representative broken state.
- Explicit permission boundaries for consequential actions.
- Small skills with narrow triggers instead of one broad controller.
- Durable state only when work can outlive a session.
- Standards are named in their owning skills but applied only when relevant.
- User information is judged by findability, understanding, action, recovery, and real task evidence—not readability alone.
- Static validation is not proof of live routing, tool availability, dogfooding, automated UAT, user comprehension, accessibility conformance, or formal standards conformance.

See the [release audit](docs/AUDIT.md) and [repository-integrity audit](docs/REPOSITORY-AUDIT.md) for findings, limits, and package relationships. [`PACKAGE-VALIDATION.json`](PACKAGE-VALIDATION.json) covers static source and package structure only; it is not a runtime-quality, usability, accessibility, or standards-conformance claim.

## Release integrity

The V8.13.0 release package retains strict Quick Mode metadata validation, the integrated 27-routine standards pack, and zero supplemental adapters. The V8.13.0 communication revision no longer treats the V8.8 textual snapshot as a current prose gate. The remaining-standards and controlled-execution packs are source-only, excluded from generated profiles, and retain their own references, licensing limits, and public-source disclaimers. Release packages are reproducibly generated from source and include SHA-256 inventories, a manifest, validation records, the licence, notices, six profiles, and a master archive. The committed [`dist/v7.2`](dist/v7.2) directory remains a historical V7.2.0 snapshot; new binary builds are not accumulated on `main`.

## Security

Treat skills and workflow instructions as executable policy. Review them before installation. Do not auto-update or run untrusted hooks or installers. See [SECURITY.md](SECURITY.md).

## Licence

MIT. See [LICENSE](LICENSE).

Legally reused or adapted material is documented in [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md). Conceptual inspiration and research lineage are documented in [docs/HISTORY.md](docs/HISTORY.md) and [docs/STANDARDS-REGISTER.md](docs/STANDARDS-REGISTER.md).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for validation and change requirements.
