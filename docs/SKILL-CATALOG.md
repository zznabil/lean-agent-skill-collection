# Lean Agent Skills V8.5.1 catalog

V8.5.1 keeps the same 23 canonical skills, six profiles, invocation policy, and proportional-rigor behavior as V8.5.0. The patch changes repository validation portability only: small work still uses DIRECT, consequential work escalates to DEEP, and Gauntlet remains the bounded ADVERSARIAL ceiling.

| Skill | Profile role | Invocation | Principal explicit sources |
|---|---|---|---|
| `architecture` | engineering, complete | implicit | ISO 42010; ATAM; ADR/MADR; OpenAPI/JSON Schema; RFC 9457/9413; AsyncAPI/CloudEvents |
| `browser-automation` | engineering, complete | implicit | WCAG 2.2; WAI-ARIA APG; ISO 9241-110/112/171; ISO 21801-1; ISO/IEC 23859 and 29138 |
| `cli-design` | engineering, complete | implicit | RFC 9413; IEC/IEEE 82079-1-inspired actionable help and recovery |
| `debug` | engineering, complete | implicit | Evidence-first debugging practices |
| `experiment` | engineering, complete | implicit | GQM; ISO 31000; Chaos Engineering when authorized |
| `gauntlet-loop` | core, engineering, complete, get-it-done, gauntlet | manual | ISO 25010; ISO 29119; ISO 15026-2; user-information, ASVS, WCAG, and AI-assurance lanes as applicable |
| `get-it-done` | core, engineering, complete, get-it-done | manual | ISO 29148; ISO 12207; BCP 14; Unlazy-informed proof integrity |
| `grilling` | complete | manual | ISO 29148; EARS; BCP 14 |
| `handoff` | core, engineering, complete | manual | Durable-state and structured-handoff practice |
| `implement` | engineering, complete | implicit | NIST SSDF; OWASP ASVS; proportional-rigor and smallest-correct-diff practice |
| `merge-conflicts` | engineering, complete | implicit | Three-way merge and verification practice |
| `office-files` | complete | implicit | IEC/IEEE 82079-1; ISO/IEC/IEEE 26514; ISO 9241-112:2025; format-aware validation |
| `plan` | core, engineering, complete | implicit | ISO 29148; EARS; BCP 14; ISO 25010; ISO 31000 family; ISO/IEC 29138-1/-4 |
| `project-context` | engineering, complete | manual | ISO 5259; ISO 25012/25024; Model/Data Cards; FAIR; ISO 42005 |
| `release` | engineering, complete | implicit | ISO 12207; SemVer; Conventional Commits; SLSA/SPDX/CycloneDX/Reproducible Builds |
| `research` | core, engineering, complete | implicit | Primary-source and benchmark-regime disclosure practice |
| `review` | core, engineering, complete | implicit | ISO 20246; ISO 25010; ISO 15026-2; user-information sources; Google code-review; evidence-backed simplification |
| `skill-design` | core, engineering, complete | implicit | ISO 20741; structural/routing/behavioural evaluation; task-based user-information evaluation |
| `teach` | complete, communication, get-it-done, gauntlet | implicit | CAST UDL 3.0; IES practice guide; Feynman; COGA; Diátaxis; cognitive load; worked examples; self-explanation; retrieval |
| `test` | engineering, complete | implicit | ISO 29119; TDD; test pyramid; property/state-machine testing; TLA+ escalation; oracle calibration |
| `triage` | engineering, complete | implicit | NIST SP 800-61r3; Google SRE |
| `wait-what` | core, engineering, complete, communication, get-it-done, gauntlet | manual | ASD-STE100 Issue 9; ISO 24495-1; W3C COGA; ISO/IEC 23859; ISO 21801-1; ISO 704; Diátaxis; BCP 14 |
| `writing` | complete, communication, get-it-done, gauntlet | implicit | IEC/IEEE 82079-1; ISO/IEC/IEEE 26514/26513; ISO/IEC 23859; ISO 21801-1; ISO 9241-112/171; ISO/IEC 29138; ISO 704; ISO 24495-1; COGA; Diátaxis |
