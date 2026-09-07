# Evidence at a changed boundary

Select only the boundary under test; these are test design prompts, not a second controller or a universal standards checklist.

## API and protocol

For HTTP/data/event changes, validate accepted and rejected examples against the project-selected contract and exercise a real caller or consumer compatibility check. Match method, status, fields and errors, including stable problem type and non-leaking details where RFC 9457 is adopted. Test ambiguous representations are rejected, not silently reinterpreted. OpenAPI, JSON Schema, AsyncAPI and CloudEvents apply to their respective HTTP, data, message and adopted-envelope contracts; do not require all formats together. (RFC 9413).

## Security and identity

For protected actions, exercise permitted, denied, expired/revoked and cross-user access where relevant. Observe server-side enforcement rather than a hidden UI control. Test recovery and sensitive-data handling against the project's selected assurance level and retention/deletion rules. (NIST SSDF; OWASP ASVS; NIST SP 800-63-4; ISO 31700-1; CISA Secure by Design).

## Interface and information

For UI or instructions, test the rendered keyboard/focus/name/role/state journey, including error, interruption and recovery. Map intended user need to barrier and observable requirement; check warnings before commitment, clear terms and preserved work. Automated accessibility checks are partial evidence; intended-user task evaluation remains necessary when the claim requires it. (WCAG 2.2; WAI-ARIA APG; ISO 9241-110/112/171; ISO 21801-1; ISO/IEC 29138/23859; IEC/IEEE 82079-1; ISO/IEC/IEEE 26513/26514; ISO 704).

## AI and data

For AI or data-driven changes, test applicable injection, excess authority, poisoning or leakage cases at the affected tool/data boundary. Keep held-out examples separate from repeatedly tuned cases; record data/model/evaluator revisions, subgroup limits and uncertainty. A judge's opinion, clean prompt or benchmark inventory is not executed assurance. (NIST AI RMF; NIST SP 800-218A; NIST AI 100-2e2025; OWASP LLMSVS/AISVS; OWASP Agentic Top 10; MITRE ATLAS; ISO/IEC 5259/25012/25024/5338).

## Lifecycle and critical state

For persistence, retries, concurrency or migration, check invariants across failure, cancellation, restart and rollback at the real integration boundary. Pair material quality claims with a quality scenario, acceptance criterion and current evidence. A formal model, when justified, cannot replace implementation tests. (ISO/IEC/IEEE 12207/15026-2; ISO/IEC 25010; TLA+).

Regulated or safety-critical acceptance requires applicable authoritative standards and qualified review; this reference does not establish domain conformance.
