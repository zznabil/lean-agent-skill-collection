# V9 design and source decisions

Historical V9.0.0 candidate design. [V9.0.1](V9.0.1-DESIGN.md) supersedes its standards-activation decision and ships the consolidation after repair.

Reviewed 6 September 2026 against V8.7.0 commit `71e5c44e97be8fd2808288de57ea574cc3c252e2`. The current user request authorises a breaking reduction below 20 skills and delivery through the existing protected release workflow.

## Source-derived guidance

[OpenAI GPT-5.6 guidance](https://developers.openai.com/api/docs/guides/latest-model?model=gpt-5.6#prompting-best-practices) recommends intent, context, constraints and success criteria over detailed choreography; removing duplicated rules; evaluating deletions on the same cases; and specifying autonomy boundaries. It warns that broad brevity instructions can over-compress necessary information.

[OpenAI GPT-6 Astra guidance](https://developers.openai.com/api/docs/guides/latest-model?model=gpt-6-astra#prompting-best-practices) highlights sensitivity to conflicting instructions, stopping and permission boundaries, structured verbosity and testing calibration. It supports completing the intended task while respecting actual authority, explaining true blockers, and repeating or expanding tests when evidence warrants it rather than by default.

[OpenAI skill authoring guidance](https://learn.chatgpt.com/docs/build-skills) describes progressive disclosure, precise descriptions and focused procedures with optional local references and adapter metadata. [AGENTS.md guidance](https://learn.chatgpt.com/docs/agent-configuration/agents-md) describes scoped instruction discovery; installing a skill is not identical to injecting a root policy.

The user-supplied article screenshot independently motivates shorter triggers, conditional context, explicit boundaries and a completion definition that includes running, inspecting and fixing the result. It is supplied material, not a benchmark. The user's YAGNI prompts are the design brief: minimise unnecessary implementation, never required correctness or safety. No screenshot image or third-party runtime is bundled.

## Lean decisions, not provider guarantees

Keep 17 routes: enough separation for genuinely different user jobs without separate architecture, interviewing, CLI, conflict, triage or context controllers. Keep the six profiles and full communication trio in both task packs. Preserve get-it-done as the sustained-work owner and Gauntlet as explicitly requested bounded acceptance, not competing automatic controllers.

Reduce root policy to essential shared defaults. Use outcome-based skill roots, narrowly triggered local references and short adapters. Preserve standalone permission and reporting safeguards where losing them would make an isolated skill misleading. Reference material is not dumped into every task. Named standards stay primarily in the historical register and relevant owning material, not in every answer.

Remove mandatory four-mode classification, mandatory progress bars, repeated global prose paragraphs and bloated adapter default prompts. Retain valid host/user presentation preferences without duplicating summaries. Do not introduce a language-specific coding skill, custom runtime, hook, SDK, provider account or new installed dependency.

For GPT-5.6, the working hypothesis is that less duplicated choreography leaves more room for task evidence. For GPT-6 Astra, explicit scope, standing approval, completion and testing boundaries aim to avoid avoidable pauses, overformatted replies and needless repeat checks. These are hypotheses informed by guidance, not measured performance results.

## Safeguard ownership

| Requirement retained | V9 owner |
|---|---|
| Smallest complete design; clear robust code, not golf | AGENTS / implement |
| Actual authority; reuse existing approval, read back uncertain writes | AGENTS / release / browser-automation |
| Complete implementation, run/inspect, fix and verify | AGENTS / implement / get-it-done |
| Trust-boundary validation, security and necessary failure modes | implement / conditional engineering core |
| Concurrency, idempotency, unknown results and migration recovery | plan/ARCHITECTURE / engineering core |
| Falsifiable gates, positive controls, independently calculated quantities | test / engineering core |
| Evidence freshness and parent verification | review / get-it-done / Gauntlet |
| Independent reviewer limitations and non-passing missing gates | review / Gauntlet |
| Bounded work, recoverable state, truthful terminal states | get-it-done / Gauntlet local references |
| Source fidelity, uncertainty and direct accountable claims | research / writing / wait-what |
| Practical teaching and usable instructions | teach / writing/USER-INFORMATION |
| Trusted-context changes need specific authority | handoff/CONTEXT / skill-design |
| Versioned delivery, archive integrity and public readback | release / build and validation scripts |

## Verification boundary

The repository validates structure, inventory, budgets, references and artifact integrity; authored scenarios describe intended behaviour. Neither establishes that a model selects or obeys a skill. Live activation, task success, false-positive routing, actual token use, completion time, satisfaction and host equivalence remain unmeasured. See the [evaluation protocol](evals/README-v9.md).

The builder no longer emits an unconditional passing verdict in package metadata. Validators inspect actual packaged source bytes and exact checksum coverage, not only policy flags. Existing ZIP safety, reproducibility and supported-host gates remain, with independent damaged fixtures for the new contracts. Source checksum coverage is all tracked files except the manifest itself; hashes are not authenticity or behavioural assurance.

Historical reviews and published artifacts remain unchanged. The standards register's historical dates are not refreshed merely because route ownership changes. No new formal conformance claim is made.
