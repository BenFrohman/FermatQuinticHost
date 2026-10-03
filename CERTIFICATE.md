# Certificate for V(F5)

Copyright (c) 2026 Benjamin Stanley Frohman (`@BenFrohman`). Apache-2.0.

The real host is the Fermat quintic fourfold

    F5 = x0^5 + x1^5 + x2^5 + x3^5 + x4^5 + x5^5
    V(F5) subset P^5

Lean module: `Hodge/VF5.lean`, namespace `Hodge.VF5`.
`Hodge/NewHost.lean` is a placeholder filename and is not the host name.

`hostLabel.name` is the string `V(F5)`. That structure is not a scheme.
`T_F` is not used. It remains `CycleSection.construct` in the sister repo.

Certified in this module, Init only, no `sorry`:

- `G_euler_defect` rejects the degree-6 product.
- `affine_cone_isolated_at_origin` is a statement on `Int`.
- `h31_dim` is 120, not 0.
- `sextic_Z_status` is `uncomputed`.

Not certified: a scheme-theoretic Jacobian proof, a cycle, a period matrix,
or a value of `Z`. `1751` is a complex container dimension, not a rational rank.
