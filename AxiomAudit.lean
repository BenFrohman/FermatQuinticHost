-- Axiom audit: prints the axioms of every theorem/lemma in the project.
-- CI fails unless each depends only on propext, Classical.choice, Quot.sound (or none).
import Hodge.VF5

#print axioms Hodge.VF5.G_euler_defect
#print axioms Hodge.VF5.affine_cone_isolated_at_origin
#print axioms Hodge.VF5.euler_F5
#print axioms Hodge.VF5.h31_dim
#print axioms Hodge.VF5.host_dim
#print axioms Hodge.VF5.host_is_VF5
#print axioms Hodge.VF5.int_five_mul_prod4_eq_zero
#print axioms Hodge.VF5.partial_as_prod
#print axioms Hodge.VF5.sextic_Z_status_uncomputed
#print axioms Hodge.VF5.sextic_h22_prim_container
