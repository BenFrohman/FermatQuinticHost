# Verification certificate

**Paper:** Elementary Certified Facts for the Fermat Quintic Fourfold $V(F_5)\subset\mathbb{P}^5$: the Euler Identity, an Euler Defect, and the Isolated Integer Critical Point of the Affine Cone
**Author:** Benjamin Stanley Frohman (frohmanbenjamin@gmail.com)
**PDF:** `paper/FermatQuinticHost_Technical_Monograph_2026.pdf`

| Item | Value |
|---|---|
| Verified commit | `0b56d4b210d9418931af559cc06fdda2ee5b9bd1` |
| Lean toolchain | `leanprover/lean4:v4.22.0` |
| Mathlib | none (Lean core only) |
| CI run (build + axiom audit + no-sorry scan, passed) | https://github.com/BenFrohman/FermatQuinticHost/actions/runs/41794839040 |
| Source tarball SHA-256 (verified commit) | `726065496f5fb2841642e615f7e7c0eb0fd7b3e6927d4bba7dfe4e2dd7d3568a` |

- `lake build` succeeds with the pinned toolchain.
- No `sorry`, no `admit`, no `native_decide`, and no user-declared `axiom` in the Lean sources (enforced in CI by `scripts/check_no_sorry.py`).
- All 10 audited theorems depend only on Lean's standard axioms `propext`, `Classical.choice`, `Quot.sound` (or a subset).

## `#print axioms` output (`AxiomAudit.lean`)

```
'Hodge.VF5.G_euler_defect' depends on axioms: [propext, Classical.choice, Quot.sound]
'Hodge.VF5.affine_cone_isolated_at_origin' depends on axioms: [propext, Classical.choice, Quot.sound]
'Hodge.VF5.euler_F5' depends on axioms: [propext, Classical.choice, Quot.sound]
'Hodge.VF5.h31_dim' does not depend on any axioms
'Hodge.VF5.host_dim' does not depend on any axioms
'Hodge.VF5.host_is_VF5' does not depend on any axioms
'Hodge.VF5.int_five_mul_prod4_eq_zero' depends on axioms: [propext]
'Hodge.VF5.partial_as_prod' depends on axioms: [propext, Classical.choice, Quot.sound]
'Hodge.VF5.sextic_Z_status_uncomputed' does not depend on any axioms
'Hodge.VF5.sextic_h22_prim_container' does not depend on any axioms
```

The paper's claims correspond one-to-one with the Lean declarations listed in its "Correspondence between claims and Lean declarations" section; the Lean statements are the source of truth.
