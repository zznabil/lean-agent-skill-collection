# Lean Agent Skill Collection

[![Version](https://img.shields.io/badge/version-v8.5.1-2563eb)](CHANGELOG.md)
[![Skills](https://img.shields.io/badge/skills-23-0f766e)](skills)
[![Validation](https://github.com/zznabil/lean-agent-skill-collection/actions/workflows/validate.yml/badge.svg)](https://github.com/zznabil/lean-agent-skill-collection/actions/workflows/validate.yml)

A compact, source-browsable collection of 23 vendor-neutral agent skills for engineering, research, communication, documents, experiments, and quality work. OpenAI-specific metadata lives in thin adapters beside each skill.

> **AI provenance and review warning:** The collection decisions were heavily assisted by GPT-5.6 Sol Pro. Model involvement is not evidence of quality or correctness. Treat every skill as untrusted policy until you have reviewed it and tested it in your own host and project.

V8.5.1 keeps every V8.5.0 skill, profile, and invocation rule unchanged. It repairs repository validation on Windows PowerShell 5.1 by reading UTF-8 contract files explicitly and avoiding a parser-sensitive Unicode literal. The proportional-rigor system remains: DIRECT for small decisive work, STANDARD for bounded subsystem work, DEEP for long-running or consequential work, and ADVERSARIAL only when hidden-defect risk justifies Gauntlet. Read the [minimum-scrutiny review](docs/MINIMUM-SCRUTINY-REVIEW-v8.5.0.md), [Unlazy re-audit](docs/UNLAZY-REVIEW-v8.4.0.md), [project history](docs/HISTORY.md), and [repository audit](docs/REPOSITORY-AUDIT.md).

## Start here

Choose one profile. Do not install overlapping profiles together.

| Profile | Skills | Best for | Generated package |
|---|---:|---|---|
| Core | 8 | Planning, research, review, and long-running work | `lean-agent-skills-core-openai-v8.5.1.zip` |
| Engineering | 19 | Software delivery and engineering operations | `lean-agent-skills-engineering-openai-v8.5.1.zip` |
| Complete | 23 | The full collection | `lean-agent-skills-complete-openai-v8.5.1.zip` |
| Communication | 3 | Clear replies, teaching, writing, and user information | `user-facing-communication-mini-openai-v8.5.1.zip` |
| Get It Done | 5 | Long-horizon execution, acceptance, and complete communication support | `get-it-done-pack-openai-v8.5.1.zip` |
| Gauntlet Loop | 4 | High-risk adversarial review with complete communication support | `gauntlet-loop-pack-openai-v8.5.1.zip` |

The Get It Done and Gauntlet packs each include the full Communication trio. `wait-what` is included once through set union, not duplicated.

Browse the [skill catalog](docs/SKILL-CATALOG.md) before choosing a profile.

## Install

Install one profile ZIP as a skills-only plugin where your host supports it. Otherwise, extract one package and copy its `skills/` directories into the user-level or repository-level skill directory used by your agent host.

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
skills/                       Canonical source for all 23 skills
.codex-plugin/                Complete-profile plugin manifest
docs/                         Catalog, audits, history, standards, and evaluations
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
./scripts/build-release.ps1
./scripts/test-validator.ps1
./scripts/validate.ps1 -ArtifactsDirectory ./artifacts/v8.5.1
./scripts/audit-repository.ps1 -ArtifactsDirectory ./artifacts/v8.5.1
```

The builder produces all six profiles and a master archive with fixed entry order and timestamps. The validators check metadata, profile inventories, licensing, source hashes, user-facing and considerate-agency contracts, human-usable information, evaluation mirrors, package checksums, text hygiene, temporary scaffolds, duplicate and case-colliding ZIP members, traversal, symlinks, executables, local links, placeholders, and common secret patterns. They do not install or execute any skill.

## Design principles

- Use the minimum sufficient scrutiny that can prove the outcome; small work stays small, and every extra check or agent must close a distinct evidence gap.
- Evidence before claims. Acceptance oracles must observe the named outcome and fail honestly under a representative broken state.
- Explicit permission boundaries for consequential actions.
- Small skills with narrow triggers instead of one broad controller.
- Durable state only when work can outlive a session.
- Standards are named in their owning skills but applied only when relevant.
- User information is judged by findability, understanding, action, recovery, and real task evidence—not readability alone.
- Static validation is not proof of live routing, user comprehension, accessibility conformance, or formal standards conformance.

See the [release audit](docs/AUDIT.md) and [repository-integrity audit](docs/REPOSITORY-AUDIT.md) for findings, limits, and package relationships. [`PACKAGE-VALIDATION.json`](PACKAGE-VALIDATION.json) covers static source and package structure only; it is not a runtime-quality, usability, accessibility, or standards-conformance claim.

## Release integrity

The source on `main` is canonical for V8.5.1. Release packages are reproducibly generated from the tagged source and include SHA-256 inventories, a manifest, validation records, the license, notices, six profiles, and a master archive. The committed [`dist/v7.2`](dist/v7.2) directory remains a historical V7.2.0 snapshot; new binary builds are not accumulated on `main`.

## Security

Treat skills and workflow instructions as executable policy. Review them before installation. Do not auto-update or run untrusted hooks or installers. See [SECURITY.md](SECURITY.md).

## License

MIT. See [LICENSE](LICENSE).

Legally reused or adapted material is documented in [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md). Conceptual inspiration and research lineage are documented in [docs/HISTORY.md](docs/HISTORY.md) and [docs/STANDARDS-REGISTER.md](docs/STANDARDS-REGISTER.md).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for validation and change requirements.
