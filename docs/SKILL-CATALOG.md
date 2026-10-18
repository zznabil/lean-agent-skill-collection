# Lean Agent Skills catalog

Current inventory: 24 base task skills. The table below matches the canonical `skills/` directories and [release profile](../release-profiles.json).

Current composition rules: [Skill composition](SKILL-COMPOSITION.md). They preserve the catalog membership and invocation policy below.

V8.10.1 adds `quick-mode` as an explicit user-selected fast path in Complete. It is not automatically selected by short questions or duration requests.

V8.9.0 supplemental standards remain available in the consolidated generated Complete profile through `packs/user-facing-standards/`; they add no adapters and retain explicit rights and public-source limitations.

Historical V8.8.0 retained 23 canonical base task skills, six profiles, and its invocation policy. Outcome-first delivery is a global overlay and local fallback, not a routed skill. It changes response sizing, completion reporting, tool-intent closure, and host/user presentation precedence.

The direct-claims overlay is present in every profile and standalone skill fallback. It changes reporting, not specialist routing or acceptance criteria.

| Skill | Profile role | Invocation | Principal explicit sources |
|---|---|---|---|
| `architecture` | complete | implicit | ISO 42010; ATAM; ADR/MADR; OpenAPI/JSON Schema; RFC 9457/9413; AsyncAPI/CloudEvents |
| `browser-automation` | complete | implicit | WCAG 2.2; WAI-ARIA APG; ISO 9241-110/112/171; ISO 21801-1; ISO/IEC 23859 and 29138 |
| `cli-design` | complete | implicit | RFC 9413; IEC/IEEE 82079-1-inspired actionable help and recovery |
| `debug` | complete | implicit | Evidence-first debugging practices |
| `experiment` | complete | implicit | GQM; ISO 31000; Chaos Engineering when authorized |
| `gauntlet-loop` | complete | manual | ISO 25010; ISO 29119; ISO 15026-2; user-information, ASVS, WCAG, and AI-assurance lanes as applicable |
| `get-it-done` | complete | manual | ISO 29148; ISO 12207; BCP 14; Unlazy-informed proof integrity |
| `grilling` | complete | manual | ISO 29148; EARS; BCP 14 |
| `handoff` | complete | manual | Durable-state and structured-handoff practice |
| `implement` | complete | implicit | NIST SSDF; OWASP ASVS; proportional-rigor and smallest-correct-diff practice |
| `merge-conflicts` | complete | implicit | Three-way merge and verification practice |
| `office-files` | complete | implicit | IEC/IEEE 82079-1; ISO/IEC/IEEE 26514; ISO 9241-112:2025; format-aware validation |
| `plan` | complete | implicit | ISO 29148; EARS; BCP 14; ISO 25010; ISO 31000 family; ISO/IEC 29138-1/-4 |
| `project-context` | complete | manual | ISO 5259; ISO 25012/25024; Model/Data Cards; FAIR; ISO 42005 |
| `quick-mode` | complete | explicit request | User-authorized working slice; minimum reality check; preserved safety and selected acceptance |
| `release` | complete | implicit | ISO 12207; SemVer; Conventional Commits; SLSA/SPDX/CycloneDX/Reproducible Builds |
| `research` | complete | implicit | Primary-source and benchmark-regime disclosure practice |
| `review` | complete | implicit | ISO 20246; ISO 25010; ISO 15026-2; user-information sources; Google code-review; evidence-backed simplification |
| `skill-design` | complete | implicit | ISO 20741; structural/routing/behavioural evaluation; task-based user-information evaluation |
| `teach` | complete | implicit | CAST UDL 3.0; IES practice guide; Feynman; COGA; Diátaxis; cognitive load; worked examples; self-explanation; retrieval |
| `test` | complete | implicit | ISO 29119; TDD; test pyramid; property/state-machine testing; TLA+ escalation; oracle calibration |
| `triage` | complete | implicit | NIST SP 800-61r3; Google SRE |
| `wait-what` | complete | manual | ASD-STE100 Issue 9; ISO 24495-1; W3C COGA; ISO/IEC 23859; ISO 21801-1; ISO 704; Diátaxis; BCP 14 |
| `writing` | complete | implicit | IEC/IEEE 82079-1; ISO/IEC/IEEE 26514/26513; ISO/IEC 23859; ISO 21801-1; ISO 9241-112/171; ISO/IEC 29138; ISO 704; ISO 24495-1; COGA; Diátaxis |
## Supplemental user-facing standards

The canonical [user-facing standards pack](../packs/user-facing-standards/README.md) contributes 27 separately loadable supplemental routines to the consolidated Complete release profile. Their authoritative order and source/rights links are maintained in the [supplemental catalog](../packs/user-facing-standards/CATALOG.md); these routines carry no OpenAI adapters and do not alter the 24 base task routes. The effective Complete profile total is 51.

Source-only packs remain separate: [remaining standards](../packs/remaining-standards/CATALOG.md) has 63 routines plus 7 gated routines; [controlled execution](../packs/controlled-execution/CATALOG.md) has 13 mechanisms. See the [2026-10-11 source re-audit](UPSTREAM-REAUDIT-2026-10-11.md) for pinned provenance and evidence limits.
