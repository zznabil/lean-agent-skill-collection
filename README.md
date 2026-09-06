# Lean Agent Skill Collection

![Version](https://img.shields.io/badge/version-v9.0.1-blue)

**V9.0.1 - Lean Standards, Explicit Behaviour.** Seventeen focused, vendor-neutral procedures for agents that should finish the actual task, verify it and communicate clearly without unnecessary ceremony.

Lean supplies instructions, not a runtime, sandbox, model upgrade or guarantee of obedience. V9 is informed by current GPT-5.6 and GPT-6 Astra guidance; behavioural gains and cross-host equivalence remain unmeasured.

## Choose one profile

| Profile | Skills | Use |
|---|---:|---|
| Complete | 17 | All procedures |
| Engineering | 14 | Code, tests, research and delivery |
| Core | 8 | Planning, review and sustained work |
| Communication | 3 | Teach, clarify and write |
| Get It Done | 5 | Sustained execution, acceptance and communication |
| Gauntlet | 4 | Bounded acceptance and communication |

The two task packs include all three communication skills. Complete is a superset, not 17 simultaneous agents. See the [catalogue](docs/SKILL-CATALOG.md) for exact triggers and membership.

## Install or upgrade

Use one release profile per installation scope. Install it through a host that supports the package, or copy its `skills/` subdirectories into the host's documented skills directory. The optional `agents/openai.yaml` metadata is not a portable enforcement mechanism.

Review and merge relevant root `AGENTS.md` guidance into the intended trusted scope. Do not overwrite existing project instructions blindly. `ENGINEERING-CORE.md` is conditional and included only in Core, Engineering, Complete and Get It Done. Standalone skills carry their own essential boundaries and local references.

**V8 users:** follow the [V9 migration guide](docs/MIGRATION-v9.md). Replace the previous profile rather than overlaying it; otherwise six retired routes can remain installed. Back up local changes and remove only known Lean-owned files. Publishing a release does not update your PC or active agent sessions.

Confirm the actual loaded source and explicit invocation in your host. Codex, ChatGPT, OMP and Hermes do not have interchangeable discovery or prompt assembly. The [Hermes notes](docs/HERMES-INTEGRATION.md) are a pinned integration review, not proof that your current installation loads Lean.

## What changed

The standing policy now covers scope, the smallest complete solution, completion and concise reporting. Seventeen short skill roots route specialised detail only when needed. Architecture and requirement discovery belong to planning; CLI and conflict handling belong to implementation; triage belongs to debugging; project context belongs to handoff.

Required correctness, permissions, validation, failure handling, evidence and recovery remain. Removed defaults include repeated global prose blocks, oversized adapter prompts, compulsory progress bars and four named scrutiny modes for ordinary tasks. More work or review must address an actual gap, not satisfy a ritual.

See [design and sources](docs/V9-DESIGN.md), [measured size changes](docs/V9-SIZE.json) and [evaluation limits](docs/evals/README-v9.md). Byte and word reductions are not model token savings or task-success scores.

## Build and verify

Requires PowerShell 7 or Windows PowerShell 5.1; no third-party module is needed.

```powershell
./scripts/build-release.ps1 -OutputDirectory ./artifacts/repro-a
./scripts/test-validator.ps1 -ArtifactsDirectory ./artifacts/repro-a
./scripts/validate.ps1 -ArtifactsDirectory ./artifacts/repro-a
./scripts/audit-repository.ps1 -ArtifactsDirectory ./artifacts/repro-a
```

CI builds twice and compares every output on both supported PowerShell hosts. Validation checks actual source, profile inventories, budgets, local references, package bytes and hashes, and rejects damaged controls. Generated `PACKAGE-VALIDATION.json` files are declarations, not self-awarded passing test results.

The legacy-named `UPSTREAM-CHECKSUMS.sha256` covers the whole tracked source except itself. It is an integrity inventory, not a signature or proof that instructions improve behaviour. The release builder is intended to produce six profile ZIPs and a master archive with manifests, checksums and licence files. Check the tagged release and its CI records for execution evidence; the source alone is not a passing verdict. [Release procedure](releases/v9.0.1/RELEASE-NOTES-v9.0.1.md).

MIT licence; retained attributions are in [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md). Historical reviews, fixtures and releases remain historical evidence.

## V9.0.1 standards repair

See [design](docs/V9.0.1-DESIGN.md), the [97-entry register](docs/STANDARDS-REGISTER.md) and [structural ownership map](docs/STANDARDS-COVERAGE.json). V9.0.1 is the first V9 publication target after an unreleased V9.0.0 candidate; publication is gated by the release procedure. Standards names are provenance, not a conformance claim.
