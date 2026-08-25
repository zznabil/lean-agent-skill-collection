# Lean Agent Skill Collection

[![Release](https://img.shields.io/badge/release-v7.2-2563eb)](https://github.com/zznabil/lean-agent-skill-collection/tree/main/dist/v7.2)
[![Skills](https://img.shields.io/badge/skills-30-0f766e)](skills)
[![Validation](https://github.com/zznabil/lean-agent-skill-collection/actions/workflows/validate.yml/badge.svg)](https://github.com/zznabil/lean-agent-skill-collection/actions/workflows/validate.yml)

A compact, source-browsable collection of 30 vendor-neutral agent skills for engineering, research, communication, interfaces, documents, and quality work. OpenAI-specific metadata lives in thin adapters beside each skill.

## Start here

Choose one profile. Do not install overlapping profiles together.

| Profile | Skills | Best for | Package |
|---|---:|---|---|
| Core | 9 | Planning, research, review, and long-running work | [ZIP](dist/v7.2/lean-agent-skills-core-openai-v7.2.zip) |
| Engineering | 22 | Software delivery and engineering operations | [ZIP](dist/v7.2/lean-agent-skills-engineering-openai-v7.2.zip) |
| Complete | 30 | The full collection | [ZIP](dist/v7.2/lean-agent-skills-complete-openai-v7.2.zip) |
| Communication | 3 | Clear replies, teaching, and writing | [ZIP](dist/v7.2/user-facing-communication-mini-openai-v7.2.zip) |
| Get It Done | 3 | Long-horizon execution and acceptance | [ZIP](dist/v7.2/get-it-done-pack-openai-v7.2.zip) |
| Gauntlet Loop | 1 | High-risk adversarial quality review | [ZIP](dist/v7.2/gauntlet-loop-pack-openai-v7.2.zip) |

Browse the [skill catalog](docs/SKILL-CATALOG.md) before choosing a profile.

## Install

Install one profile ZIP as a skills-only plugin where your host supports it. Otherwise, extract one package and copy its `skills/` directories into the user-level or repository-level skill directory used by your agent host.

Each package follows this layout:

```text
.codex-plugin/plugin.json
skills/<skill>/SKILL.md
skills/<skill>/agents/openai.yaml
```

The `SKILL.md` files are vendor-neutral. Hosts other than ChatGPT or Codex can ignore `agents/openai.yaml`.

## Repository layout

```text
skills/                 Canonical source for all 30 skills
.codex-plugin/          Complete-profile plugin manifest
docs/                   Catalog, audit, and provenance
dist/v7.2/              Verified release archives and checksums
scripts/validate.ps1    Local static and integrity checks
UPSTREAM-CHECKSUMS...   Complete-profile source hashes before repo documentation
```

## Validate

On PowerShell 7 or Windows PowerShell 5.1:

```powershell
./scripts/validate.ps1
```

The validator checks package hashes and sizes, ZIP path safety, JSON metadata, skill frontmatter, adapter presence, the expected 30-skill inventory, and canonical source hashes. It excludes the root README from the upstream hash set because this repository replaces the package README with expanded project documentation. It does not install or execute any skill.

## Design principles

- Evidence before claims.
- Explicit permission boundaries for consequential actions.
- Small skills with narrow triggers instead of one broad controller.
- Durable state only when work can outlive a session.
- Static validation is not presented as proof of live routing behavior.

See the [deep-dive audit](docs/AUDIT.md) for findings, strengths, limitations, and package relationships.

## Release integrity

All seven inner V7.2 archives match the SHA-256 and byte-size inventory in [`openai-native-skill-collections-v7.2-validation.json`](dist/v7.2/openai-native-skill-collections-v7.2-validation.json). The original master archive is also retained in [`dist/v7.2`](dist/v7.2).

## Security

Treat skills and workflow instructions as executable policy. Review them before installation. Do not auto-update or run untrusted hooks or installers. See [SECURITY.md](SECURITY.md).

## License and attribution

No project-wide open-source license was supplied with this collection. Publication alone does not grant reuse rights. Selected mechanics were derived from Every's MIT-licensed Compound Engineering Plugin at a pinned revision; see [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for validation and change requirements.
