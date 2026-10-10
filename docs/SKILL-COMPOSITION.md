# Skill composition

## Contract

Reader: an agent or maintainer selecting existing skills for one authorized task.
Composition assigns distinct responsibilities to selected skills. It does not add a runtime, controller, permission, base skill or automatic loading rule.
The default is one primary task skill. Add a supporter only for a distinct responsibility required by the task. A role is not a required execution sequence.

### Primary ownership

The agent MUST resolve one primary lifecycle owner before composed execution:
1. Use the owner explicitly designated by the user. Merely requesting several skills does not designate several owners.
2. Otherwise use `get-it-done` if selected.
3. Otherwise use the unique substantive task skill after assigning distinct support roles.
4. If competing claims remain, stop affected actions and report the skills, conflicting claims and the owner decision needed. Safe inspection may continue. Do not choose by load order, last instruction or strongest wording.

A sole selected skill keeps its standalone ownership and status vocabulary. If Quick Mode is the sole skill, it owns its working slice. If Gauntlet is primary, its Lead owns the assurance task lifecycle. An explicit user designation can make Get It Done a supporter; its state rules then describe its contribution, not a second task lifecycle.
A designated owner must be available, selected and loaded before executing its instructions. Availability does not establish selection; source presence does not prove loading or obedience.

### Responsibilities

| Role | Existing skill or policy | Boundary |
|---|---|---|
| Scope modifier | `quick-mode` | Define the user-authorized minimum useful slice, optional validation and visible deferrals. |
| Lifecycle owner | Primary task skill, normally `get-it-done` when selected | Own progress, integrated scope, recovery coordination and final run status. |
| Capability executor | `browser-automation` | Execute authorized journeys; own observations, execution evidence and per-journey verdicts. |
| Assurance phase | `gauntlet-loop` | Own the independent assurance benchmark, evidence judgment and acceptance verdict. |
| Context support | `project-context` | Own context provenance and readiness; readiness is not completed execution. |
| Release responsibility | `release` | Own release evidence and publication go/no-go; preserve all required release gates. |
| Presentation overlay | Communication kernel | Communicate facts clearly without changing scope, evidence, permissions or verdicts. |

The primary owner MUST NOT suppress independent failed assurance. A supporter MUST NOT silently acquire lifecycle ownership or issue a competing final task status.
Roles name responsibility, not authority to take external action. Two skills may contribute evidence to one responsibility only if one accountable owner remains clear. Do not create parallel controllers.

### Precedence and conflicts

Host instruction authority still applies. Within the authorized task, mandatory safety and trusted repository policy take precedence; retain authorization boundaries and explicit user acceptance criteria before role defaults or presentation preferences.
A scope modifier MUST NOT weaken permissions, security, privacy, data integrity, required compatibility or accessibility, recovery safeguards or mandatory acceptance. Less optional work does not grant more authority.
If mandatory instructions cannot both be satisfied, stop the affected action with the conflict, missing decision and safe next step. Do not reinterpret failure as success.
For conflicting final verdicts, preserve the failed or missing-required-evidence result. The lifecycle owner reconciles evidence, not by voting or averaging verdicts. Only fresh evidence from the applicable verifier can resolve a factual disagreement.

## Supported combinations

| Case | Assignment and required result |
|---|---|
| A: Quick + Get It Done | Quick modifies the authorized scope. Get It Done finishes that scope, reports deferred hardening and does not presume production readiness. |
| B: Quick + Browser | Browser owns the browser task; Quick modifies optional validation. Execute the actual journey when selected. Source, compilation and screenshots alone are not dogfooding. |
| C: Quick + Gauntlet | Gauntlet owns the assurance task; Quick constrains optional working scope. Retained criteria and independent failures remain mandatory. |
| D: Get It Done + Gauntlet | Get It Done owns lifecycle status. Gauntlet owns assurance. Failed required assurance prevents `DONE`. |
| E: All four | Get It Done owns lifecycle; Quick modifies scope; Browser executes; Gauntlet judges. Return one owner report with execution and assurance evidence. |
| F: Competing lifecycle claims | Apply explicit-owner / selected-Get-It-Done / unique-task precedence. Otherwise stop affected actions with a clear ownership conflict. |
| G: Quick + Release | Release owns the release task unless another primary is designated. Quick cannot weaken release gates, authorization, integrity or public verification. |
| H: Quick + destructive work | Keep exact authorization, safe-state verification, hold points and recovery. Reduced scope cannot authorize deletion or bypass safeguards. |
| I: Automated UAT | Require a known start, user-level interaction, observable failure-sensitive assertions, replayable execution and cleanup/reset. A one-off interaction is not repeatable UAT. |
| J: Single skill / existing profile / standalone | Keep ordinary selection and ownership. No new base route, profile member or root dependency. |

Other combinations are not automatically supported. Assign non-overlapping responsibilities under the same ownership and safety contract before execution. If a selected skill cannot honor its support role, stop that combination or return to one skill only when doing so does not omit required work. Report unavailable optional support and the resulting verification limit. Required unavailable support blocks its dependent acceptance; it cannot be silently skipped.

## Execution and evidence

The lifecycle owner records the authorized scope, retained acceptance and selected responsibilities in the existing plan, ledger or concise task context. This does not require a new file or metadata schema.
Quick Mode may remove only work the user authorized as optional or deferred. An explicit reduced slice can pass its own acceptance while production readiness remains `NOT ASSESSED`. Do not silently extend the slice later.
Capability execution uses the real authorized interface and known starting state. Read back mutations and inspect uncertain outcomes before retrying. Browser evidence belongs to the executor; the owner preserves the environment, action, assertion and result without upgrading the claim.
Assurance uses independent evidence review and its own verdict. A supporting Gauntlet Lead freezes assurance scope within the authorized task, not a rival task scope. Its existing critics, benchmark and failure rules remain intact. Selected mandatory scrutiny is not optional merely because Quick Mode is active.

Keep these distinctions explicit:
- Source present / source loaded.
- Skill available / skill selected / behavior followed.
- Static preservation checks / live agent decision evidence / real interface execution.
- Dogfooding / replayable automated UAT.
- Scoped acceptance passing / production readiness assessed.
- Standards-inspired wording / formal conformance.

Automated UAT must reject a representative broken state as well as pass a positive control. Record a replay command or artifact and cleanup/reset. A screenshot is useful evidence of a state, not proof of the actions that reached it.

### Final status

Only the primary owner emits final task run status. Include the working result, retained scope, execution verdicts, assurance verdict, missing or failed checks, deferrals, production-readiness limit and remaining user action in one coherent report. Preserve the vocabulary needed to interpret each contribution; do not rename `FAIL` to a passing task result.
Required failed acceptance prevents accepted completion. Missing required evidence remains unverified or `NOT JUDGED`, not `PASS`. Get It Done MUST NOT report `DONE` in either situation. A useful partial artifact may still be handed over with the exact unmet requirement.
Presentation never changes verdict polarity, evidence freshness, authorization or acceptance scope.

### Stop and recovery

Stop dependent execution on unresolved ownership, missing authorization, unsafe state, a material gate mismatch or unavailable required capability. Report the exact blocked action, observed result and missing prerequisite. Finish independent safe useful work without crossing that boundary.
For a failed journey, preserve the evidence, repair within authorized scope and rerun the affected verifier plus adjacent regressions. Do not retry an uncertain external mutation until read-back establishes its state.
A fresh result is required after an affected artifact, verifier, input, environment, entrypoint, authentication context or dependency changes. The owner resumes the existing scope; an assurance failure does not transfer lifecycle control to the critic.

## Standalone portability

Each affected `SKILL.md` contains the ownership, role, safety and evidence fallback needed without root instructions or this document. Required companion resources remain inside that skill folder. Do not load a sibling skill or root document merely to obtain a missing mandatory rule.
Generated profiles inherit the root contract through their existing policy generator and retain local fallbacks. Profile membership and implicit/manual invocation remain unchanged. A profile lacking a requested skill does not prove that the skill was selected or loaded.
The remaining-standards and controlled-execution packs remain source-only; this contract does not install or activate them.

## Verification boundary

Use the existing package, integrity, portability and negative validators for structural claims. The focused composition evaluator tests trace-backed skill loading and live OMP decisions against positive and adversarial cases. Its calibration fixtures test the evaluator, not host obedience.
Real browser UAT evidence is a separate executable-interface gate. Report the tested host, model, package and commands. Hosts not exercised are **NOT TESTED**. One host's successful decisions do not establish universal cross-host behavior.
