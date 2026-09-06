# Repository integrity - V9

Source identity and release profile inventories come from the exact reviewed revision. `UPSTREAM-CHECKSUMS.sha256` now lists every tracked source file except itself, including hidden configuration, scripts, documentation and intentionally retained historical artifacts. Temporary `.git`, `artifacts`, `.audit-work` and `.agent-state` directories are not source. An unlisted source file or duplicate checksum fails validation; there are no unchecked README or metadata exceptions.

Hashes establish agreement with the manifest, not its authenticity. The release process therefore also checks the exact merge revision, required CI, annotated tag target and downloaded assets. A deterministic build is not proof of model obedience or program correctness.

The repository audit verifies current version surfaces, 64 uniquely identified authored V9 scenarios, live scenario owners and historical fixture mirrors. It does not convert scenario counts into pass rates. UTF-8, newline, local-reference and secret-pattern checks are structural safeguards, not exhaustive security audits.

Operational source-transfer and publication workflows belong only on temporary operations branches. They must not enter canonical main. Published release history remains unchanged. Review [migration](MIGRATION-v9.md) before replacing an installation; no local installation is changed by repository publication.
