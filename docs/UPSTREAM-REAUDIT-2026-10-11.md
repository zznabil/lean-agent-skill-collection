# Upstream re-audit record — 2026-10-11

## Decision and scope

Keep the 24-skill base architecture and the existing three-driver communication kernel: ASD-STE100-inspired language, ISO 704-inspired terminology and Diátaxis architecture. This record reconciles current documentation and source provenance. It imports no upstream code, runtime, controller or skill.

The reviewed Lean baseline is V8.17.0, [`89a96c163521e6ead8898c40d8b85eebe25716ad`](https://github.com/zznabil/lean-agent-skill-collection/commit/89a96c163521e6ead8898c40d8b85eebe25716ad). Its inventories remain 24 base skills, 27 integrated supplemental routines, 63 optional remaining-standards routines, 7 gated routines and 13 controlled-execution mechanisms: 134 source skills. Generated profile totals remain 36, 47, 51, 30, 33 and 31. The two optional packs remain outside generated profiles.

The [machine-readable provenance ledger](UPSTREAM-PROVENANCE-2026-10-11.json) records 45 primary sources: 43 repositories and two paper-only sources. Two supporting repositories bring the unique repository count to 45. It preserves exact current review revisions, historical pins or explicit unknowns, component scope, rights, evidence links and review triggers. Current means observed during this dated audit, not whatever a branch resolves to later.

## Evidence boundaries

- Fourteen sources have exact historical pins: four MAJOR, four MODERATE, five NONE and one COSMETIC scoped delta.
- Eleven research sources use paper-version or reconstructed-cutoff comparisons. Their original reviewed pins remain unknown; a reconstructed revision never fills that field.
- Twenty sources have unknown historical baselines and UNKNOWN deltas. A current feature or recent release is not proof of a change since Lean reviewed it.
- Addy Osmani and the three Ultracode candidates fit the historical narrative, but their owner-qualified historical mappings are probable, not established by a recovered pin.
- Inspection covered selected source, implementation, tests and metadata. All upstream runtime and live-model tests were NOT RUN. Source-visible behavior and test definitions are not executed verification.
- Compound and Hermes compare responses capped changed-file listings at 300. Selected before/after reads establish the stated mechanisms, not an exhaustive repository diff. Builder Agent-Native was inspected through selected subtrees after a large tree response failed. The Schema website's 6,271,847-byte page exceeded retrieval limits; its full bytes were not audited.
- No cross-system score, token saving, latency saving, host compatibility or improvement to Lean is established by this record. Standards-publication editions were not comprehensively re-audited.

## Current identity and rights corrections

1. [OpenAI Skills](https://github.com/openai/skills/blob/49f948faa9258a0c61caceaf225e179651397431/README.md) is deprecated and points to [OpenAI Plugins](https://github.com/openai/plugins/tree/0722921d5542fc593105c27bd52630babd8b8c2a). Keep both source identities. V5 already names OpenAI Plugins; no old OpenAI Skills reviewed pin was recovered.
2. [Microsoft Windows skills](https://github.com/microsoft/win-dev-skills/blob/5ce74fa89c49ca353c6ab03bd5889aa519aa9e5e/.agents/plugins/marketplace.json) now points WinUI/WinApp specialists to [WinApp CLI](https://github.com/microsoft/winappCli/tree/57aee35fcd083c0e892bcd8a03ac9ad16e372c08), while retaining its own WinDbg plugin. A marketplace's license does not cover every external tool it installs.
3. [Builder Skills](https://github.com/BuilderIO/skills/tree/68d86be7a0e1ad585406cbe19cdf7ec8a8504498) and [Builder Agent-Native](https://github.com/BuilderIO/agent-native/tree/df30cabc851dcde166f344b80b5e911f4045976f) are distinct repositories. Count Builder Skills once. Plow-ahead is byte-identical at its two reviewed commits despite the repository's MODERATE delta. Mirrored exports are not independent innovations.
4. [Caveman's current licensing record](https://github.com/JuliusBrussee/caveman/blob/2e08b9177c07bb7249a8a2d1a6758e5db281d002/LICENSING.md) assigns Apache-2.0 to current repository code from 3.0.0. Preserve retained MIT contribution notices and separate bundled-asset terms. Historical pre-3.0 BSL code keeps its historical terms; Caveman Cloud is separate commercial software. This corrects current rights without reversing Lean's core style/runtime rejection.
5. Rights are component-specific. Agentic Awesome Skills distinguishes MIT code, CC BY 4.0 original non-code and upstream exceptions. Anthropic's sampled document skills have restrictive terms distinct from nearby Apache-2.0 skills. Several repositories declare MIT in metadata or READMEs without a complete standalone notice. Public arc-skill and Retrodict source visibility does not establish redistribution rights. The ledger retains these limitations; it is not legal clearance to copy.
6. Current [Prime Agent main](https://github.com/PrimeIntellect-ai/prime-agent/tree/2ee7e623a70d8ccd9c72ffc6c4f25be2cc1bc02d), stable v0.10.0 and the separately pinned v0.3.3 ARC reproduction are different evidence targets. The LICENSE text is MIT despite inconclusive API metadata. ARC results do not validate the current Rust runtime.

## Documentation reconciliation

- The current base catalog contains Quick Mode exactly once, with its four existing profiles and explicit-request condition. Its adapter remains implicit-capable; adapter metadata does not broaden the skill's activation rule.
- The standards register identifies the active three-driver kernel. Its V8.13 CDC-default passage remains as a superseded historical snapshot. CDC CCI remains task-selected for public communication.
- The controlled-execution catalog links to the merged remaining-standards routines rather than calling PR #17 open.
- History preserves old adoption decisions and version snapshots under historical labels. A dated current checkpoint supplies the active counts and policy.

## Maintenance and verification

Run `python -B scripts/test-catalogue-provenance.py --self-test` to validate route/profile membership, source-pack counts, current driver records and ledger integrity, then calibrate the guard against broken copies. The checks include an omitted Quick Mode row and a stale CDC default-driver assertion. They verify documentation contracts, not host activation, runtime behavior or model obedience.

When a future review changes these facts, add a new dated record and preserve the old review revisions. Before reuse or installation, recheck source identity, ownership, the selected component and its full applicable rights. A new upstream HEAD or a successor link is not authorization to install it.
