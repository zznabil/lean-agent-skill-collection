# AI and agent assurance

Load this resource only for an AI model, agent, MCP system, RAG workflow, evaluator, memory system, or tool-using application. Select versioned requirements and threat cases for the actual architecture. Do not copy an entire catalogue into the benchmark.

## Source hierarchy

Use current official sources where they apply. Use this order:

1. Explicit user and product requirements.
2. NIST AI RMF and the Generative AI Profile for risk framing.
3. NIST SP 800-218A for secure AI-system development.
4. NIST adversarial-machine-learning taxonomy for evasion, poisoning, privacy, and misuse threats.
5. OWASP AISVS and LLMSVS for testable security requirements.
6. OWASP Agentic Top 10 for agent-specific failure patterns.
7. MITRE ATLAS for adversary tactics, techniques, mitigations, and cases.

Record the source version, requirement or technique ID, applicability decision, verification method, evidence, and status. Selected checks do not establish compliance with an entire standard. Do not claim that compliance.

## Required lanes

Select only lanes that apply:

- **Instruction boundary:** check direct and indirect prompt injection, system or developer instruction integrity, retrieved-content trust, and output-to-instruction confusion.
- **Tools and authority:** check least privilege, allowlists, argument validation, approval boundaries, capability discovery, unavailable tools, and excessive agency.
- **External effects:** check intent recording, idempotency, read-back after uncertain results, destructive-action confirmation, and rollback.
- **Memory and state:** check provenance, write authorization, poisoning, stale or refuted lessons, cross-user separation, retention, deletion, and safe resumption.
- **Retrieval and data:** check source authority, licence, sensitive data, poisoning, leakage, relevance, faithfulness, and untrusted embedded instructions.
- **Model and provider:** check identity, version, serving-family verification, fallback behavior, context limits, model change, and evidence invalidation.
- **Plugins, MCP, and dependencies:** check source revision, executable code, transport, authentication, permissions, auto-update behavior, supply chain, and compromised-server behavior.
- **Evaluation integrity:** check public versus holdout cases, evaluator identity, rubric, threshold, variance, leakage, repeated optimization, benchmark gaming, and fabricated evidence.
- **Monitoring and recovery:** check traceability, policy violations, unusual tool use, failed actions, user-visible harm, incident response, rollback, and retirement.

## Evidence levels

Prefer deterministic checks for contracts, permissions, schemas, and exact outputs. Evaluate traces for trajectory and tool use. Use an LLM judge only when objective evidence is insufficient. Record judge identity, rubric, dataset revision, randomness, repetitions, variance, and cost. Do not treat a public or repeatedly exposed evaluation set as an untouched final holdout.

## Final decision

A final pass requires evidence for applicable hard gates, real tool and environment behavior, sensitive-data boundaries, recovery, and the complete critical journey. Keep unsupported claims `UNVERIFIED`. Mark missing access `BLOCKED`. Mark bounded non-convergence `FAIL` or `BUDGET EXHAUSTED`, not success.
