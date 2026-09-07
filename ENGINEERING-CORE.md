# Conditional engineering checks

Read only sections relevant to the change. This file supplements standalone skills; it is not a mandatory pre-edit reading list.

## Contracts and boundaries

Trace required behaviour through its real callers, inputs, outputs and shared owner. Prefer characterisation before changing poorly tested behaviour. Validate at trust boundaries, authorise each protected action, keep secrets out of logs and preserve unrelated work. Review dependency source, licence, lifecycle scripts and lockfile changes before adoption. Use NIST SSDF and the applicable project-selected OWASP ASVS controls; this is not a conformance claim.

## State, retries and recovery

Give shared state an owner. Preserve invariants across concurrent writers, cancellation, shutdown and restart. Distinguish success, failure and an unknown result after timeout. For consequential retries, bind idempotency to intent, claim atomically and reconcile unknown results before repeating side effects. Check the retention horizon and recovery path where they matter.

For migrations, expand compatibility, backfill or dual-write as needed, switch consumers, verify the old path is unused, then contract. Destructive contraction comes last. Identify a realistic rollback or recovery point before consequential changes. Keep UI, API, CLI and background entry points consistent on validation, authorisation and errors.

## Evidence

Choose checks that can distinguish correct from broken behaviour at the required boundary. For an absence claim, prove the detector sees a known positive case. For supplied quantities, calculate independently from source data. Test representative broken states for load-bearing guards when practical. Exit zero or a printed success word alone does not prove the outcome.

Evidence becomes stale after a relevant artifact, verifier, input, dependency, environment or entry-point change. Recheck affected claims, not every unrelated test. Record what ran, where, on which revision and with what result. Unit, mocked, simulated and production evidence are different scopes. Missing evidence is not a pass; an incomplete required gate remains blocking unless an authorised scope change removes it.

## Interfaces and operations

Preserve the existing design system. Check required loading, empty, error, validation, keyboard, focus, resize and recovery states against rendered behaviour, not source inspection alone. Apply WCAG and native semantics where applicable; automated checks alone cannot establish accessibility conformance.

For consequential delivery, verify the critical user or operator journey, configuration, startup, persistence, recovery and useful error signals. Add telemetry only to answer a real operator question. Keep each check proportional to the actual risk.

## Coordination and records

Use one owner per coupled area. Parallel work needs genuinely independent scopes and real host handles; otherwise work sequentially. The parent verifies returned artifacts and integrated boundaries. Do not claim independent approval from the builder's own review.

Record decisions, evidence and the next action, not hidden reasoning. Source names indicate provenance, not conformance.

## Standards in use

- For material quality or assurance claims, state the quality scenario, claim, supporting argument and current evidence; keep gaps blocking when the contract requires proof. (ISO/IEC 25010; ISO/IEC/IEEE 15026-2).
- For lifecycle changes, carry requirements and verification through delivery, operation, recovery and retirement; do not stop at a successful build. (ISO/IEC/IEEE 12207).
- For personal-data or security-default changes, minimise collection, restrict access, define retention/deletion and keep secure defaults; do not transfer avoidable protection work to users. (ISO 31700-1; CISA Secure by Design).
