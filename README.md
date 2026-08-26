# Lean Agent Skill Collection

[![Release](https://img.shields.io/badge/release-v7.4.1-2563eb)](https://github.com/zznabil/lean-agent-skill-collection/releases/tag/v7.4.1)
[![Skills](https://img.shields.io/badge/skills-30-0f766e)](skills)
[![Validation](https://github.com/zznabil/lean-agent-skill-collection/actions/workflows/validate.yml/badge.svg)](https://github.com/zznabil/lean-agent-skill-collection/actions/workflows/validate.yml)

A compact, source-browsable collection of 30 vendor-neutral agent skills for engineering, research, communication, interfaces, documents, and quality work. OpenAI-specific metadata lives in thin adapters beside each skill.

> **AI provenance and review warning:** The collection decisions are AI slop chosen by GPT-5.6 Sol Pro. This describes the collection's origin, not its quality or correctness. Treat every skill as untrusted policy until you have reviewed it and tested it in your own host and project.

Read the [project history](docs/HISTORY.md) for the path from a Pro-mode workaround, through a 139-to-29 lean refactor, to the current 30-skill V7.4.1 collection.

## Start here

Choose one profile. Do not install overlapping profiles together.

| Profile | Skills | Best for | Package |
|---|---:|---|---|
| Core | 9 | Planning, research, review, and long-running work | [ZIP](https://github.com/zznabil/lean-agent-skill-collection/releases/download/v7.4.1/lean-agent-skills-core-openai-v7.4.1.zip) |
| Engineering | 22 | Software delivery and engineering operations | [ZIP](https://github.com/zznabil/lean-agent-skill-collection/releases/download/v7.4.1/lean-agent-skills-engineering-openai-v7.4.1.zip) |
| Complete | 30 | The full collection | [ZIP](https://github.com/zznabil/lean-agent-skill-collection/releases/download/v7.4.1/lean-agent-skills-complete-openai-v7.4.1.zip) |
| Communication | 3 | Clear replies, teaching, and writing | [ZIP](https://github.com/zznabil/lean-agent-skill-collection/releases/download/v7.4.1/user-facing-communication-mini-openai-v7.4.1.zip) |
| Get It Done | 3 | Long-horizon execution and acceptance | [ZIP](https://github.com/zznabil/lean-agent-skill-collection/releases/download/v7.4.1/get-it-done-pack-openai-v7.4.1.zip) |
| Gauntlet Loop | 1 | High-risk adversarial quality review | [ZIP](https://github.com/zznabil/lean-agent-skill-collection/releases/download/v7.4.1/gauntlet-loop-pack-openai-v7.4.1.zip) |

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
skills/                 Canonical source for all 30 skills
.codex-plugin/          Complete-profile plugin manifest
docs/                   Catalog, audit, and provenance
dist/v7.2/              Historical V7.2.0 release snapshot
release-profiles.json   Canonical version and six profile inventories
scripts/build-release.ps1  Deterministic release builder
scripts/validate.ps1    Static source and release integrity checks
UPSTREAM-CHECKSUMS...   Complete-profile source hashes before repo documentation
```

## Validate

On PowerShell 7 or Windows PowerShell 5.1:

```powershell
./scripts/build-release.ps1
./scripts/test-validator.ps1
./scripts/validate.ps1 -ArtifactsDirectory ./artifacts/v7.4.1
```

The builder produces all six profiles and a master archive with fixed entry order and timestamps. The validator checks strict metadata fields, profile inventories, licensing, source hashes, communication-overlay contracts, package checksums, duplicate and case-colliding ZIP members, traversal, symlinks, executables, readable entries, local links, placeholders, and common secret patterns. It does not install or execute any skill.

## Design principles

- Evidence before claims.
- Explicit permission boundaries for consequential actions.
- Small skills with narrow triggers instead of one broad controller.
- Durable state only when work can outlive a session.
- Static validation is not presented as proof of live routing behavior.

See the [deep-dive audit](docs/AUDIT.md) for findings, strengths, limitations, and package relationships. [`PACKAGE-VALIDATION.json`](PACKAGE-VALIDATION.json) covers static source and package structure only; it is not a runtime-quality claim.

## Release integrity

GitHub Releases are the canonical download location. Each release includes its SHA-256 inventory, manifest, root `PACKAGE-VALIDATION.json` record, license, notices, six profile packages, and master archive. The committed [`dist/v7.2`](dist/v7.2) directory is retained as a historical V7.2.0 snapshot; future binary releases are not accumulated on `main`.

## Security

Treat skills and workflow instructions as executable policy. Review them before installation. Do not auto-update or run untrusted hooks or installers. See [SECURITY.md](SECURITY.md).

## License

MIT. See [LICENSE](LICENSE).

Legally reused or adapted material is documented in [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md). Conceptual inspiration and research lineage are documented in [docs/HISTORY.md](docs/HISTORY.md).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for validation and change requirements.
