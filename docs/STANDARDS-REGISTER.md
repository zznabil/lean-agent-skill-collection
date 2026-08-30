# Standards register — V8.3.0

Public documentation for standards and engineering practices that influence Lean Agent Skills. Relevant source names are also placed beside the rules they inform in `AGENTS.md`, `ENGINEERING-CORE.md`, and owning skills. This register is not loaded automatically into agent context.

## Rules

- Record the exact edition or version when known.
- Mark living, draft, superseded, or transitional sources honestly.
- A Lean decision is not a claim of formal conformance.
- Conceptual influence belongs here and in project history; legally reused text or code belongs in `THIRD_PARTY_NOTICES.md`.
- Re-review an entry when its trigger fires.
- Unless noted, Lean independently summarizes behaviour and does not reproduce proprietary normative text.

## Register

| Candidate | Version/status | Decision | Lean home | Reviewed | Next review | Official source |
|---|---|---|---|---|---|---|
| ASD-STE100 | Issue 9, January 2025 | Existing foundation; version pinned | `wait-what / AGENTS.md` | 2026-08-30 | Issue 10 or later | [source](https://asd-ste100.org/) |
| BCP 14 (RFC 2119 + RFC 8174) | Stable RFCs | Existing foundation | `AGENTS.md / all skills` | 2026-08-26 | RFC update or interpretation change | [source](https://www.rfc-editor.org/info/rfc8174) |
| ISO/IEC/IEEE 29148 | 2018 | Existing foundation | `ENGINEERING-CORE / plan` | 2026-08-26 | New edition | [source](https://www.iso.org/standard/72089.html) |
| ISO/IEC 25010 | 2023 | Existing foundation | `ENGINEERING-CORE / review / gauntlet-loop` | 2026-08-26 | New edition | [source](https://www.iso.org/standard/78176.html) |
| ISO/IEC/IEEE 29119 series | Current series | Existing foundation | `test / gauntlet-loop` | 2026-08-26 | Material series revision | [source](https://committee.iso.org/sites/jtc1sc7/home/projects/flagship-standards/isoiecieee-29119-series.html) |
| ISO/IEC/IEEE 12207 | 2026 | Existing foundation | `ENGINEERING-CORE / get-it-done` | 2026-08-26 | New edition | [source](https://www.iso.org/standard/90219.html) |
| NIST SP 800-218 SSDF | 1.1 final | Existing foundation | `ENGINEERING-CORE / review / release` | 2026-08-26 | Final SSDF 1.2 or later | [source](https://csrc.nist.gov/pubs/sp/800/218/final) |
| OWASP ASVS | 5.0.0 stable | Existing conditional benchmark | `review / gauntlet-loop` | 2026-08-26 | New stable major/minor | [source](https://owasp.org/www-project-application-security-verification-standard/) |
| WCAG | 2.2 Recommendation | Existing conditional benchmark | `browser-automation / review` | 2026-08-26 | New Recommendation | [source](https://www.w3.org/TR/WCAG22/) |
| Architecture Decision Records | Living practice | Existing foundation | `architecture / project-context` | 2026-08-26 | Material practice update | [source](https://adr.github.io/) |
| OpenAPI Specification | 3.2.0 | Existing conditional contract | `architecture / test` | 2026-08-26 | New stable version | [source](https://spec.openapis.org/oas/v3.2.0.html) |
| JSON Schema | 2020-12 | Existing conditional contract | `architecture / test / skill-design` | 2026-08-26 | New stable draft | [source](https://json-schema.org/specification) |
| Semantic Versioning | 2.0.0 | Existing project-adopted practice | `release` | 2026-08-26 | New release | [source](https://semver.org/) |
| Conventional Commits | 1.0.0 | Existing project-adopted practice | `release` | 2026-08-26 | New release | [source](https://www.conventionalcommits.org/en/v1.0.0/) |
| NIST AI RMF + Generative AI Profile | AI RMF 1.0 / GenAI Profile | Existing conditional benchmark | `gauntlet-loop/AI-ASSURANCE.md` | 2026-08-26 | New profile or framework version | [source](https://www.nist.gov/itl/ai-risk-management-framework) |
| OWASP LLMSVS | 2.0 | Existing conditional benchmark | `gauntlet-loop/AI-ASSURANCE.md` | 2026-08-26 | New stable version | [source](https://owasp.org/www-project-llm-verification-standard/) |
| EARS | Living requirements method | Adopt syntax | `plan / grilling` | 2026-08-26 | Material method revision | [source](https://alistairmavin.com/ears/) |
| ISO/IEC/IEEE 15026-2 assurance cases | Current edition | Strongly absorb | `ENGINEERING-CORE / review / gauntlet-loop` | 2026-08-26 | New edition | [source](https://www.iso.org/standard/80625.html) |
| Goal–Question–Metric | Established practice | Strongly absorb | `experiment` | 2026-08-26 | Material modern revision | [source](https://ntrs.nasa.gov/citations/19860020886) |
| ISO 24495-1 plain language | 2023 | Absorb | `writing / wait-what` | 2026-08-26 | New edition | [source](https://www.iso.org/standard/78907.html) |
| W3C COGA guidance | Living supplemental guidance | Absorb | `wait-what / writing / teach` | 2026-08-26 | Material W3C update | [source](https://www.w3.org/WAI/WCAG2/supplemental/patterns/o3p01-clear-words/) |
| Diátaxis | Living practice | Absorb | `writing` | 2026-08-26 | Material framework update | [source](https://diataxis.fr/) |
| SLSA | 1.2 | Adopt conditionally | `release/SUPPLY-CHAIN.md` | 2026-08-26 | New stable version | [source](https://slsa.dev/spec/v1.2/) |
| SPDX | 3.0 stable | Adopt conditionally | `release/SUPPLY-CHAIN.md` | 2026-08-26 | SPDX 3.1 stable or new major | [source](https://spdx.dev/use/specifications/) |
| CycloneDX | 1.7 | Adopt conditionally | `release/SUPPLY-CHAIN.md` | 2026-08-26 | New stable version | [source](https://cyclonedx.org/specification/overview/) |
| Reproducible Builds definition | Living definition | Strongly absorb | `release/SUPPLY-CHAIN.md / skill-design` | 2026-08-26 | Material definition change | [source](https://reproducible-builds.org/docs/definition/) |
| RFC 9457 Problem Details | 2023 | Adopt conditionally | `architecture` | 2026-08-26 | Obsoleted or updated RFC | [source](https://www.rfc-editor.org/rfc/rfc9457.html) |
| RFC 9413 protocol robustness | 2023 | Absorb | `architecture / cli-design / ENGINEERING-CORE` | 2026-08-26 | Obsoleted or updated RFC | [source](https://www.rfc-editor.org/info/rfc9413) |
| Google SRE SLO and error-budget practice | Living practice | Strongly absorb | `architecture / release / review` | 2026-08-26 | Material practice update | [source](https://sre.google/workbook/error-budget-policy/) |
| W3C Trace Context | Recommendation | Adopt conditionally | `architecture / release / review` | 2026-08-26 | New Recommendation | [source](https://www.w3.org/TR/trace-context/) |
| OpenTelemetry specifications and semantic conventions | Living versioned specs | Adopt upstream selectively | `architecture / release / review` | 2026-08-26 | New stable semantic-convention release | [source](https://opentelemetry.io/docs/specs/) |
| ISO 31700-1 privacy by design | 2023 | Strongly absorb | `ENGINEERING-CORE / review` | 2026-08-26 | New edition | [source](https://www.iso.org/standard/84977.html) |
| CISA Secure by Design | Living guidance | Absorb | `ENGINEERING-CORE / architecture` | 2026-08-26 | Material guidance revision | [source](https://www.cisa.gov/securebydesign) |
| NIST SP 800-63-4 Digital Identity Guidelines | Final | Project-local benchmark | `review / architecture` | 2026-08-26 | New revision | [source](https://csrc.nist.gov/pubs/sp/800/63/4/final) |
| NIST SP 800-218A | Final | Conditional benchmark | `gauntlet-loop/AI-ASSURANCE.md` | 2026-08-26 | New revision | [source](https://csrc.nist.gov/pubs/sp/800/218/a/final) |
| NIST AI 100-2e2025 adversarial ML taxonomy | 2025 | Conditional threat source | `gauntlet-loop/AI-ASSURANCE.md` | 2026-08-26 | New edition | [source](https://csrc.nist.gov/pubs/ai/100/2/e2025/final) |
| OWASP AISVS | 1.0 | Adopt conditionally | `gauntlet-loop/AI-ASSURANCE.md` | 2026-08-26 | New stable version | [source](https://owasp.org/www-project-artificial-intelligence-security-verification-standard-aisvs-docs/) |
| OWASP Agentic Top 10 | 2026 | Conditional threat source | `gauntlet-loop/AI-ASSURANCE.md` | 2026-08-26 | New release | [source](https://genai.owasp.org/resource/owasp-top-10-for-agentic-applications-for-2026/) |
| MITRE ATLAS | Living knowledge base | Conditional threat source | `gauntlet-loop/AI-ASSURANCE.md` | 2026-08-26 | Material technique update | [source](https://atlas.mitre.org/) |
| ISO/IEC 5259 series | Current series | Strongly absorb | `project-context/AI-ASSET-CARDS.md` | 2026-08-26 | Material series revision | [source](https://www.iso.org/standard/81093.html) |
| ISO/IEC 25012 data quality model | 2008 | Absorb | `project-context/AI-ASSET-CARDS.md / review` | 2026-08-26 | New edition | [source](https://www.iso.org/standard/35736.html) |
| ISO/IEC 25024 data quality measures | 2015 | Absorb | `project-context/AI-ASSET-CARDS.md / review` | 2026-08-26 | New edition | [source](https://www.iso.org/standard/35749.html) |
| Model Cards | Established research practice | Adopt template | `project-context/AI-ASSET-CARDS.md` | 2026-08-26 | Material practice update | [source](https://research.google/pubs/model-cards-for-model-reporting/) |
| Data Cards | Established research practice | Adopt template | `project-context/AI-ASSET-CARDS.md` | 2026-08-26 | Material practice update | [source](https://research.google/pubs/data-cards-purposeful-and-transparent-dataset-documentation-for-responsible-ai/) |
| Datasheets for Datasets | Established research practice | Absorb | `project-context/AI-ASSET-CARDS.md` | 2026-08-26 | Material practice update | [source](https://arxiv.org/abs/1803.09010) |
| FAIR principles | 2016 | Absorb selectively | `project-context/AI-ASSET-CARDS.md` | 2026-08-26 | Material community revision | [source](https://doi.org/10.1038/sdata.2016.18) |
| ISO/IEC/IEEE 42010 architecture descriptions | Current edition | Absorb | `architecture / review` | 2026-08-26 | New edition | [source](https://www.iso.org/standard/74393.html) |
| ATAM | Established SEI method | Absorb mini form | `architecture / review` | 2026-08-26 | Material method update | [source](https://www.sei.cmu.edu/library/the-architecture-tradeoff-analysis-method/) |
| ISO 31000 risk management | 2018 | Absorb | `plan / architecture` | 2026-08-26 | New edition | [source](https://www.iso.org/standard/65694.html) |
| IEC 31010 risk assessment techniques | 2019 | Project-local reference | `plan / review` | 2026-08-26 | New edition | [source](https://www.iso.org/standard/72140.html) |
| ISO/IEC/IEEE 16085 software risk management | Current edition | Absorb | `plan / get-it-done` | 2026-08-26 | New edition | [source](https://www.iso.org/standard/63787.html) |
| ISO 9241-110 interaction principles | 2020 | Absorb selectively | `browser-automation / review` | 2026-08-26 | New edition | [source](https://www.iso.org/standard/75258.html) |
| ISO 9241-210 human-centred design | 2019 | Absorb selectively | `architecture / browser-automation` | 2026-08-26 | New edition | [source](https://www.iso.org/standard/77520.html) |
| ISO 9241-112 information presentation | 2025, Edition 2 | Existing source updated | `browser-automation / office-files / review` | 2026-08-30 | New edition | [source](https://www.iso.org/standard/87518.html) |
| WAI-ARIA Authoring Practices Guide | Living W3C guide | Adopt upstream selectively | `browser-automation / review` | 2026-08-26 | Material W3C update | [source](https://www.w3.org/WAI/ARIA/apg/) |
| NIST SP 800-61r3 incident response | Final | No major change; lineage | `triage/INCIDENT.md` | 2026-08-26 | New revision | [source](https://csrc.nist.gov/pubs/sp/800/61/r3/final) |
| Google SRE blameless postmortems | Living practice | No major change; lineage | `triage/INCIDENT.md / project-context` | 2026-08-26 | Material practice update | [source](https://sre.google/sre-book/postmortem-culture/) |
| AsyncAPI Specification | 3.0.0 | Adopt upstream selectively | `architecture` | 2026-08-26 | New stable version | [source](https://www.asyncapi.com/docs/reference/specification/v3.0.0) |
| CloudEvents | 1.0.x stable family | Adopt upstream selectively | `architecture` | 2026-08-26 | New stable major/minor | [source](https://github.com/cloudevents/spec) |
| SARIF | 2.1.0 | Prefer when supported | `review / cli-design` | 2026-08-26 | New standard version | [source](https://docs.oasis-open.org/sarif/sarif/v2.1.0/sarif-v2.1.0.html) |
| TLA+ | Living language and tools | Project-local escalation | `test / architecture` | 2026-08-26 | Material tool/spec update | [source](https://lamport.azurewebsites.net/tla/tla.html) |
| Principles of Chaos Engineering | Living principles | Project-local reliability technique | `experiment` | 2026-08-26 | Material practice update | [source](https://principlesofchaos.org/) |
| ISO/IEC 20246 work-product reviews | 2017 | No material change; lineage | `review` | 2026-08-26 | New edition | [source](https://www.iso.org/standard/67407.html) |
| ISO/IEC 5055 source-code quality measures | 2021 | Project-local benchmark | `review / experiment` | 2026-08-26 | New edition | [source](https://www.iso.org/standard/80623.html) |
| ISO/IEC 20741 tool evaluation | 2017 | Absorb one rule | `skill-design` | 2026-08-26 | New edition | [source](https://www.iso.org/standard/68955.html) |
| Practical test pyramid | Living practice | No major change | `test` | 2026-08-26 | Material practice update | [source](https://martinfowler.com/articles/practical-test-pyramid.html) |
| Property-based testing | Established practice | No major change | `test` | 2026-08-26 | Material practice update | [source](https://hypothesis.works/articles/what-is-property-based-testing/) |
| C2PA | 2.2 | Project-local only | `office-files / release` | 2026-08-26 | New stable version | [source](https://spec.c2pa.org/specifications/specifications/2.2/specs/C2PA_Specification.html) |
| Software Carbon Intensity / ISO/IEC 21031 | 2024 | Project-local only | `experiment / architecture` | 2026-08-26 | New edition | [source](https://greensoftware.foundation/standards/sci/) |
| CVSS | 4.0 | Project-local input only | `triage / review` | 2026-08-26 | New major version | [source](https://www.first.org/cvss/v4.0/) |
| OWASP SAMM | Current stable | Reject globally | `Organization programme only` | 2026-08-26 | New major version | [source](https://owasp.org/www-project-samm/) |
| ISO/IEC 25059 AI quality model | 2023; replacement in development | Watch | `docs/STANDARDS-REGISTER.md` | 2026-08-26 | Replacement edition final | [source](https://www.iso.org/standard/80655.html) |
| ISO/IEC 5338 AI lifecycle | 2023 | Conditional benchmark | `project-context / gauntlet-loop` | 2026-08-26 | New edition | [source](https://www.iso.org/standard/81118.html) |
| ISO/IEC 42005 AI impact assessment | 2025 | Conditional benchmark | `project-context/AI-ASSET-CARDS.md` | 2026-08-26 | New edition | [source](https://www.iso.org/standard/42005.html) |
| OWASP Agent Observability Standard | Work in progress | Defer | `docs/STANDARDS-REGISTER.md` | 2026-08-26 | Stable version and implementations | [source](https://aos.owasp.org/aos/) |
| DORA delivery metrics | Current five-metric model | Reject as individual-agent score | `Organization delivery analysis only` | 2026-08-26 | Material model update | [source](https://dora.dev/guides/dora-metrics-four-keys/) |
| Gherkin / BDD feature files | Living practice | Reject globally; project-adopted only | `plan / test` | 2026-08-26 | Material practice update | [source](https://cucumber.io/docs/gherkin/) |
| Postel-style permissive parsing | Historic principle | Reject as general boundary rule | `architecture / cli-design` | 2026-08-26 | New IETF guidance | [source](https://www.rfc-editor.org/info/rfc9413) |
| Safety-critical domain standards | Domain-specific | Project-local only | `Qualified domain workflow` | 2026-08-26 | Project enters regulated domain | Project-specific licensed source |
| Organization-scale governance frameworks | Various | Reject globally | `Organization programme only` | 2026-08-26 | Specific organizational requirement | Project-specific licensed source |

| IEC/IEEE 82079-1 information for use | 2019, Edition 2; Edition 3 committee draft | Strongly absorb; track revision | `writing/USER-INFORMATION.md / office-files / cli-design` | 2026-08-30 | Edition 3 published | [source](https://www.iso.org/standard/71620.html) |
| ISO/IEC/IEEE 26514 information for software users | 2022 | Strongly absorb | `writing / office-files / review` | 2026-08-30 | New edition | [source](https://www.iso.org/standard/77451.html) |
| ISO/IEC/IEEE 26513 testing and reviewing information for users | 2017 current; Edition 2 FDIS | Adopt review method selectively | `writing / review / gauntlet-loop` | 2026-08-30 | Edition 2 published | [source](https://www.iso.org/standard/89070.html) |
| ISO/IEC 23859 easy-to-read UI text | 2023 | Strongly absorb | `wait-what / writing / browser-automation / review` | 2026-08-30 | New edition | [source](https://www.iso.org/standard/77178.html) |
| ISO 21801-1 cognitive accessibility | 2020; confirmed 2025 | Strongly absorb | `ENGINEERING-CORE / wait-what / writing / browser-automation / review` | 2026-08-30 | New edition | [source](https://www.iso.org/standard/71711.html) |
| ISO 9241-171 software accessibility | 2025, Edition 2 | Absorb selectively | `browser-automation / review / writing` | 2026-08-30 | New edition | [source](https://www.iso.org/standard/86308.html) |
| ISO/IEC 29138-1 user accessibility needs | 2018; confirmed | Absorb lightweight needs map | `plan / browser-automation / review / writing` | 2026-08-30 | Edition 2 published | [source](https://www.iso.org/standard/71953.html) |
| ISO/IEC 29138-4 applying user accessibility needs | 2026 | Absorb lightweight needs map | `plan / browser-automation / review / writing` | 2026-08-30 | New edition | [source](https://www.iso.org/standard/89285.html) |
| ISO 704 terminology work | 2022, Edition 4 | Absorb one-concept/one-preferred-term rule | `wait-what / writing / review` | 2026-08-30 | New edition | [source](https://www.iso.org/standard/79077.html) |
| CAST UDL Guidelines | 3.0, 2024 | Absorb selectively for learner variability | `teach` | 2026-08-30 | Material guidelines revision | [source](https://udlguidelines.cast.org/) |
| IES Organizing Instruction and Study practice guide | 2007 | Absorb worked examples, graphics+words, retrieval and deep questions selectively | `teach` | 2026-08-30 | Replacement evidence synthesis | [source](https://ies.ed.gov/ncee/wwc/practiceguide/1) |
| Cognitive-load segmentation | Established research practice | Absorb small rule set | `teach / writing / wait-what` | 2026-08-30 | Material evidence update | Research lineage in release decisions |
| Worked examples and self-explanation | Established research practice | Adopt teaching pattern | `teach` | 2026-08-30 | Material evidence update | IES guide and primary research lineage |
| Inclusion Europe Easy-to-Read | Living specialized guidance | Specialized mode only; intended-user co-review required | `writing/USER-INFORMATION.md / review` | 2026-08-30 | Rules or logo conditions change | [source](https://easy-to-read.inclusion-europe.eu/) |
| CDC Clear Communication Index | Current research-based public-communication tool | Diagnostic only; no universal threshold | `writing/USER-INFORMATION.md / review` | 2026-08-30 | Material tool revision | [source](https://www.cdc.gov/ccindex/) |
| PEMAT | Current AHRQ patient-material tool | Diagnostic only; domain-specific | `writing/USER-INFORMATION.md` | 2026-08-30 | Material tool revision | [source](https://www.ahrq.gov/health-literacy/patient-education/pemat.html) |
| Feynman-style explanation | Informal heuristic; no canonical formal standard | Retain as conditional explanation pattern; correct provenance | `wait-what / teach` | 2026-08-30 | Better evidence or canonical source identified | No formal standard claimed |

## V8.3 explicitness and activation policy

- `AGENTS.md` names the global communication stack and compact engineering foundation once.
- `ENGINEERING-CORE.md` maps engineering concerns to their principal standards and practices.
- Owning skills name only the sources that materially change their work.
- Actionable rules remain local; a source name is provenance, not a compliance claim.
- User-facing prose is proportional: ASD-STE100, ISO 24495-1, and W3C COGA are the default eligible layer; Feynman, Diátaxis, and BCP 14 activate only when their function applies.
- Simple questions stay short. Heavy structure is reserved for substantive explanation, documentation, normative requirements, or complex action.

## Rejected architecture changes

- No routed `standards` skill.
- No mandatory external tool, service, SBOM, formal model, telemetry stack, or compliance framework.
- No copied ISO clause library.
- No organization maturity framework as default repository doctrine.
- No compliance claim without a scoped audit against the authoritative standard and evidence.

## V8.3 user-information policy

- Simple replies remain short; the new layer activates for substantial instructions, UI text, errors, help, onboarding, manuals, forms, and teaching.
- The core procedure contract is: intended user and task, purpose, prerequisites, action, expected result, recovery, consequences, orientation, and evidence.
- Information is layered as essential, guided, and expert detail without hiding required steps.
- A readability score is diagnostic only. Strong claims require the actual user task and intended audience; Easy-to-Read claims require intended-user co-review.
- No routed skill, external runtime, compliance claim, or universal score threshold was added.
