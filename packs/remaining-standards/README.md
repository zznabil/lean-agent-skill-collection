# Lean remaining-standards prototype pack

## Start here

This ZIP provides **70 source-specific routines**. With the previous 27 user-facing routines, they complete the historical register. This optional prototype library does not replace canonical release profiles. It does not claim adoption of all 97 entries.

Read [CATALOG.md](CATALOG.md). Select the routine for the actual task. Then read its `SKILL.md` and `SOURCES.md`. The existing task skill retains ownership of the work. Do not install every routine just because it is available.

- `skills/` contains **63** optional application routines. Each has a task-specific trigger. Some require explicit project adoption.
- `gated-skills/` contains **7** off-default guard/watch/selection routines. Keep this directory outside automatic discovery unless you deliberately test that specific guard.
- Each `SKILL.md` contains **57–62 physical lines**, including frontmatter and blank lines. Each description has at most 60 characters.
- A skill's `official/` directory contains available original publisher/author references and their notices. Some sources have no available or redistributable PDF.

This pack adds no hook, runtime, installer or automatic prompt injection. A prose description and trigger do not guarantee that a host enforces selection policy. When a host loads trusted root `AGENTS.md`, its communication policy governs every selected skill. Each `SKILL.md` also contains a standalone communication kernel. Use ASD-STE100-inspired short active technical sentences, ISO 704-inspired stable concepts and terminology, and Diátaxis purpose separation when helpful. This kernel applies with or without root policy, including direct standalone installs. Each routine retains its scoped steps, worked check and missing-evidence recovery. Do not claim that a host loaded root policy without evidence. Loading a language or standard routine does not permit an attack, release publication, production mutation or edits to trusted instructions.

## PDF and source coverage

The pack contains **26 PDF files representing 24 unique documents** across **20 entries**. The unique originals contain **1984 pages** in total. Repeated copies keep required sources local to skills that users can use independently. These files contain original bytes, not web-to-PDF conversions. The set contains formal publications, guidance, an author research draft, a NASA workshop record and a potential-errata sheet. Not all are normative standards.

### Source-byte safety
Bundled PDFs retain their source bytes. They may contain active-content markers. Do not execute embedded content. Open PDFs only in a patched, sandboxed viewer, or inspect them offline. This pack does not sanitize the bytes or claim that they are safe.

The NIST digital-identity routine contains the overview and the proofing, authentication and federation volumes. The AI SSDF routine contains its base SSDF publication. Adversarial-ML potential updates stay in a separate file. SARIF's PDF names its DOCX version as authoritative.

**Nineteen ISO/IEC/IEEE entries are source-gated.** The pack did not obtain full licensed standards. These compact routines apply Lean procedures using public scopes and existing Lean procedures. They do not provide complete clauses or reconstruct unavailable text. Obtain the exact authorised full source before a formal assessment. Do not substitute a similarly named standard or an outdated part.

Where appropriate, the pack bundles native OpenAPI, JSON Schema, SLSA, LLMSVS, AsyncAPI, CloudEvents and other permitted references in their actual formats. Labels identify partial indexes and schemas as partial. Links or images in native HTML snapshots may need online access. For unavailable or restricted PDFs, the pack retains official links and records the reason. It does not label an empty or unofficial substitute as an official standard.

Read [SOURCE-OBSERVATIONS.md](SOURCE-OBSERVATIONS.md) for source-identity corrections and access gaps. `provenance/` preserves the original 97-row register byte for byte. Observing a new or corrected source does not silently change adoption.

## Rights

This aggregation has mixed rights. CC BY-SA 4.0 covers new prose. MIT covers audit utility code. Original documents retain their own rights. Before redistribution, read [LICENSE.md](LICENSE.md), [THIRD-PARTY-NOTICES.md](THIRD-PARTY-NOTICES.md) and the individual source notes. A free download does not automatically grant a public redistribution licence.

## Verification

Use an extracted copy and Python 3.10 or newer. Run:

```sh
python audit/validate_bundle.py
python audit/test_validate_bundle.py
```

These read-only checks use the Python standard library. They mutate only temporary copies. `CHECKSUMS.sha256` lists every pack file except itself. The embedded `SOURCE-BASELINE.sha256` covers every file except the mutable ledgers and `audit/validate_bundle.py`. The validator pins that baseline. Refreshing only a checksum inventory cannot redefine content, rights or controls. A standalone extraction still needs trusted validator bytes.
The repository's `UPSTREAM-CHECKSUMS.sha256` separately pins this pack's checksum ledger. Pack-local validation does not prove that the root integration pin is current. After pack changes, update that root pin only through its authorised owner. `build_zip.py` excludes generated bytecode. It verifies a temporary archive before it atomically replaces the destination.
`audit/EXECUTED-RESULTS.json` records observed structural checks. The 210 cases in `audit/acceptance-cases.json` are authored cases, not executed model evaluations. The pack claims no invocation probability, semantic equivalence, comprehension gain or formal conformance.

## Preservation and use

Installing this optional pack does not itself change canonical task skills, release-profile membership, root safeguards, user-facing release packs or trusted user instructions. Check the host's discovery rules. Copy only selected skill folders into its documented directory. Keep skill-local source files with their owner. Repository changes outside this pack are separate from this installation boundary.

The companion all-97 ZIP keeps this pack separate from the PR16-derived user-facing standards pack. That user-facing pack is now the integrated pack with its documented CAST repair. The companion ZIP does not install 97 active skills as one profile.
