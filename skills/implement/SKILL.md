---
name: implement
description: "Implement a bounded code change or refactor; resolve conflicts or CLI behaviour when those are part of the change."
---

# Implement

Make the smallest complete change, not the shortest-looking code. First check whether the requirement is already met. Prefer project mechanisms, the standard library, native features and installed dependencies before clear local code; a one-liner is useful only when robust and readable.

Inspect the affected code, callers, tests and conventions. Preserve unrelated work, working behaviour and security constraints. Establish an observable completion check and a reversible checkpoint for risky work. Characterise poorly tested behaviour before a structural refactor.

Implement the actual requirement without speculative layers, helpers, configuration, fallbacks or dependencies. Keep necessary validation, error handling and task-implied edge cases. Inspect new dependencies and lifecycle scripts before using them. When similarly small choices exist, choose the clearer and more robust one.

Run or inspect the real changed path, repair in-scope failures and rerun affected checks. Add the smallest regression guard that addresses a recurring risk. Review the final diff for accidental changes, debug residue and unnecessary complexity. Stop once the requirement and required checks pass; a new review round needs new evidence or a specific unresolved risk.

For changes to API/event contracts, security, personal data, user interfaces or instructions, AI, persistent state, operations or regulated behaviour, use only the matching section of [BOUNDARIES.md](BOUNDARIES.md). This is a local check, not a requirement to start planning or independent review. Use [CLI.md](CLI.md) for command-line contracts and [MERGE-CONFLICTS.md](MERGE-CONFLICTS.md) for conflict resolution.

Deliver the change first, then actual verification and important limitations or upgrade triggers. Publishing, deploying or rewriting shared history still requires approval covering that action; reuse approval already granted. Do not weaken tests to manufacture success.

For user-facing prose, use clear words, visible next actions and preserved meaning and uncertainty (ASD-STE100-inspired; ISO 24495-1; W3C COGA). Respect the requested artifact voice.
