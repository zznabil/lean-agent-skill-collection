# Supply-chain assurance

Use **SLSA** to support provenance claims. Use **SPDX or CycloneDX** for inventory. Use **Reproducible Builds** for independent byte-level recreation. Each answers a different question. None alone proves correctness or security.

Load this resource only for a public, security-sensitive, distributed, or regulated release, or when the user explicitly requests provenance, an SBOM, signing, or reproducibility.

## Questions and evidence

Separate these claims:

- **Integrity:** Does the digest or signature identify the downloaded artifact?
- **Provenance:** Which source revision, builder, recipe, dependencies, and environment produced the artifact?
- **Reproducibility:** Can an independent clean build produce identical bytes?
- **Inventory:** Which components, services, licences, and dependency relationships does the artifact contain?
- **Security and correctness:** Did the evaluation cover the relevant vulnerabilities, controls, and behavior?

Evidence for one claim does not prove another.

## Minimum release record

Record the source revision, builder or workflow identity, build recipe, resolved dependency set, build environment, artifact digest, verification command, result, and evidence location. Pin build actions and toolchains where practical. Keep the generated manifest beside the release.

## Provenance

Use SLSA-style provenance when an artifact crosses a trust boundary or the build chain matters. Record the exact SLSA specification version and the controls that verification confirmed. Do not claim a level or track from self-description alone. An untrusted builder can provide provenance that accurately describes an untrusted build.

## Dependency inventory

Use SPDX or CycloneDX when machine-readable inventory affects licensing, vulnerability, customer, or regulatory decisions. Choose one format based on consumer needs and available tools. Include services and configurations only if the format and project scope support them. An SBOM lists inventory. It does not assess vulnerabilities or grant approval.

## Reproducible builds

Define the source, build instructions, dependency resolution, environment, and expected artifact. When practical, build twice in clean independent workspaces. Compare the bytes and explain controlled differences. For deterministic archives, keep file order, timestamps, permissions, path names, compression settings, and generated metadata stable.

## Signing and publication

Signing, tagging, uploading, attesting, and changing a release channel are consequential external actions. They require authorization. After publication, verify the final remote asset, digest, signature or attestation, version, and release notes. Protect signing keys. Do not expose secrets in logs or artifacts.

## Stop conditions

Return `BLOCKED` or `NO-GO` if required provenance is missing, the source or builder cannot be identified, a clean rebuild differs materially without explanation, the SBOM omits required scope, or publication would exceed the evidence. Report checks that are unavailable. Do not invent a passing result.
