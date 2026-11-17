# Kernel certificate: FermatQuinticHost

This file records a reproducible machine check of the Lean 4 development in this repository. Lean does not issue a signed "official" certificate. What is recorded here is the exact commit and toolchain, the complete `lake build` log, a scan for `sorry`/`admit`/`native_decide`/`axiom`, the `#print axioms` result for every theorem the build produces, and a replay of every module through Lean's kernel with the toolchain's `leanchecker`. Each check can be rerun with the command at the end.

| Item | Value |
|---|---|
| Repository | https://github.com/BenFrohman/FermatQuinticHost |
| Certified commit | `f9f7d2dc018bd0a449da13f6cf9860eeb579c33d` (branch `main`) |
| Lean sources | the certified commit is the `main` head itself; the certificate files were committed afterwards in a commit that changes no `.lean`, lakefile, manifest or toolchain file |
| lean-toolchain | `leanprover/lean4:v4.22.0` |
| Lean | Lean (version 4.22.0, x86_64-unknown-linux-gnu, commit ba2cbbf09d4978f416e0ebd1fceeebc2c4138c05, Release) |
| Mathlib | none (no Mathlib dependency) |
| Date (UTC) | 2026-11-16T20:53:52Z |
| CI run | https://github.com/BenFrohman/FermatQuinticHost/actions/runs/43954444749 |
| `lake build` | `Build completed successfully.` ([build.log](build.log)) |
| sorry / admit / native_decide / axiom scan | `RESULT: 0 hits` ([sorry-scan.txt](sorry-scan.txt)) |
| `#print axioms` | `AUDIT PASS: 19 theorems in 1 modules depend only on propext, Classical.choice, Quot.sound (or on no axioms)` ([axioms.txt](axioms.txt)) |
| Kernel replay (leanchecker) | `RESULT: 1 of 1 modules replayed through the kernel, 0 failures` ([leanchecker.txt](leanchecker.txt)) |

## What each check means

- **Build.** `lake build` of the default targets with the pinned toolchain. Mathlib comes from `lake exe cache get` (it is never rebuilt from source). The build elaborates every proof and sends each declaration to Lean's kernel.
- **Scan.** `certificates/tools/sorry_scan.py` strips comments and strings from every tracked `.lean` file and reports any `sorry`, `admit`, `native_decide` or `axiom` declaration. Result: RESULT: 0 hits.
- **Axioms.** `certificates/tools/gen_audit.py` imports all 1 built modules ([modules.txt](modules.txt)) and calls `Lean.collectAxioms`, the function behind `#print axioms`, on every theorem declared in them (19 theorems, auto-generated internal names excluded). `check_audit.py` fails unless each depends only on `propext`, `Classical.choice` and `Quot.sound`, or on no axioms. Raw output: [axioms.raw.txt](axioms.raw.txt); generated Lean file: [KernelCertificateAudit.lean.txt](KernelCertificateAudit.lean.txt).
- **Kernel replay.** checker: lean4checker tag v4.22.0 (0531c5e62c6bbc21af6c8b4adc2a16d201bf8b65), Main.lean prefix match -> exact match. For each module, the checker loads the module's imports from their `.olean` files and replays every declaration of that module through the kernel. The stock checker treats its argument as a module-name prefix and replays all matching modules in parallel, which runs out of memory on a root module, so it is run once per module with exact matching (the one-line patch is printed in [leanchecker.txt](leanchecker.txt)). The checker's own documentation describes it as a tool to detect environment hacking, not an independent external verifier; imported Mathlib and core declarations are trusted from their `.olean` files.

## Scope

The axiom result says the listed theorems are proved from Lean's standard axioms. It does not by itself say what the theorems mean; read the statements in the sources. Conditional theorems remain conditional on their hypotheses.

Full `#print axioms` output (verbatim from `axioms.txt`):

```
'Hodge.VF5.G_euler_defect' depends on axioms: [Classical.choice, propext, Quot.sound]
'Hodge.VF5.HostLabel.mk.inj' does not depend on any axioms
'Hodge.VF5.HostLabel.mk.injEq' depends on axioms: [propext]
'Hodge.VF5.HostLabel.mk.sizeOf_spec' does not depend on any axioms
'Hodge.VF5.affine_cone_isolated_at_origin' depends on axioms: [propext, Classical.choice, Quot.sound]
'Hodge.VF5.dF5_dx0.eq_1' does not depend on any axioms
'Hodge.VF5.dF5_dx1.eq_1' does not depend on any axioms
'Hodge.VF5.dF5_dx2.eq_1' does not depend on any axioms
'Hodge.VF5.dF5_dx3.eq_1' does not depend on any axioms
'Hodge.VF5.dF5_dx4.eq_1' does not depend on any axioms
'Hodge.VF5.dF5_dx5.eq_1' does not depend on any axioms
'Hodge.VF5.euler_F5' depends on axioms: [Classical.choice, propext, Quot.sound]
'Hodge.VF5.h31_dim' does not depend on any axioms
'Hodge.VF5.host_dim' does not depend on any axioms
'Hodge.VF5.host_is_VF5' does not depend on any axioms
'Hodge.VF5.int_five_mul_prod4_eq_zero' depends on axioms: [propext]
'Hodge.VF5.partial_as_prod' depends on axioms: [Classical.choice, propext, Quot.sound]
'Hodge.VF5.sextic_Z_status_uncomputed' does not depend on any axioms
'Hodge.VF5.sextic_h22_prim_container' does not depend on any axioms
```

## Rebuild

```
git clone https://github.com/BenFrohman/FermatQuinticHost.git && cd FermatQuinticHost && git checkout f9f7d2dc018bd0a449da13f6cf9860eeb579c33d && lake build && python3 certificates/tools/sorry_scan.py && python3 certificates/tools/gen_audit.py /tmp/KernelCertificateAudit.lean /tmp/modules.txt && lake env lean /tmp/KernelCertificateAudit.lean > /tmp/axioms.raw.txt && python3 certificates/tools/check_audit.py /tmp/axioms.raw.txt | tail -n 1
```
