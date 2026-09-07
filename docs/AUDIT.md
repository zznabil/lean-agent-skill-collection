# V9 assurance scope

This file describes the checks, not an assertion that an unbuilt revision passed. The exact CI run and release readback are the execution evidence.

The structural gate checks 17 canonical skills, six non-overlapping installation profiles, communication-complete task packs, manual adapter policy, metadata identity, instruction budgets and skill-local references. It compares packaged policy and skill bytes with source, exact file/checksum inventories, release manifest hashes and the master archive. Damaged controls exercise rejection paths independently of a successful build.

PowerShell 7 and Windows PowerShell 5.1 must each build twice, compare every output, run validator controls, validate source/packages and run the repository audit. PR evidence does not substitute for exact-main evidence.

The evaluator also distinguishes generated declarations from actual results: package metadata contains no pre-awarded pass. Authored scenarios are not executed agent tests. No live adherence, routing, task-success, token-saving, user-satisfaction, accessibility-conformance or cross-host-equivalence claim is established by these checks.

The V9 design was reviewed against the V8.7 source and the safeguard ownership table in [V9-DESIGN.md](V9-DESIGN.md). That is an author review, not an independent model evaluation. Historical audits remain available in earlier tags and versioned release records.
