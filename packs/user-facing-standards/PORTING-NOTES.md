# Public-repository import

This optional prototype comes from `lean-user-facing-standards-prototype.zip` (SHA-256 `05083456ac42535d5f7ce5269050da9ae9f144c52a034830b273467eed2663f0`).

## Scope

- All 27 narrow-purpose skills are retained below 100 physical lines. This is not a new Lean release or a default 50-skill profile.
- The 23 existing task skills, root instructions, six profile memberships, adapters, release metadata and historical standards register remain unchanged.
- No host is configured, no local installation is changed, and no publisher document is executed. The pack's checker is development tooling, not an agent runtime.

## Explicit differences from the personal-study ZIP

- Exclude the CAST organiser PDF because public redistribution permission was not established. Keep its skill and official source link. Exactly one source-access line changes in that skill; the other 26 SKILL.md files are byte-identical, including the ASD pilot.
- Update CAST source/rights notes, the catalogue and source manifest to match the public edition. Keep the other 19 publisher-file copies byte-identical.
- Add a licence boundary and W3C implementation-support notices. Preserve Diataxis CC BY-SA attribution and the IES public-domain statement.
- Add the historical direct-claims review next to the unchanged copied register so its existing relative link resolves.
- Label the earlier validation result as historical. The new VALIDATION.json is a contract declaration, not a passing verdict.
- Repair the read-only checker for POSIX path inventories on Windows, strengthen manifest and source checks, and add independently executed rejection controls. The existing collection validators are not altered.

`audit/IMPORT-RECORD.json` records original skill hashes and the sole source-access replacement. It also pins the original 97-entry coverage record, source register, user-information reference and 81 authored cases.

## Rights and source limitations

Read THIRD-PARTY-NOTICES.md and each skill's SOURCES.md. The IES PDF is public domain; W3C, RFC and Diataxis material retains its original terms. No ISO full text, ASD standard/dictionary, Inclusion Europe booklet or CAST PDF is bundled. Missing licensed texts remain explicit prerequisites, not fabricated clauses. HTML bytes remain reference data, not complete offline websites.

## Acceptance boundary

CI verifies actual source bytes, path safety, standalone reference availability, exact inventories and deliberate rejection cases. Existing collection CI still runs on both supported PowerShell hosts. The new pack check also runs on Linux and Windows.

A passing CI run is not a model-routing probability, proof of user comprehension or formal standards conformance. The 81 task cases remain authored, not executed model tests. This PR is for review only: no merge, tag, publication or automatic installation is part of opening it.
