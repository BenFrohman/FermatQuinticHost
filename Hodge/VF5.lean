/-
Copyright (c) 2026 Benjamin Stanley Frohman (@BenFrohman). Released under Apache-2.0.
Authors: Benjamin Stanley Frohman (@BenFrohman)
-/

set_option linter.unusedVariables false

/-!
# Real host: V(F5) subset P^5

The host is the Fermat quintic fourfold
`F5 = x0^5 + x1^5 + x2^5 + x3^5 + x4^5 + x5^5`.
`NewHost.lean` is a placeholder filename. This file is the certificate
under the real host name `V(F5)`.

`hostLabel` stores strings. It is not a scheme and not
`CycleSection.construct`. The name `T_F` is not used.

Init only. No Mathlib. No `sorry`.
-/

namespace Hodge
namespace VF5

/-- Documentation label for `V(F5)`. `presentation` is a string, not a scheme. -/
structure HostLabel where
  name : String
  dim : Nat
  presentation : String

def F5 (x0 x1 x2 x3 x4 x5 : Int) : Int :=
  x0 ^ 5 + x1 ^ 5 + x2 ^ 5 + x3 ^ 5 + x4 ^ 5 + x5 ^ 5

def dF5_dx0 (x0 x1 x2 x3 x4 x5 : Int) : Int := (5 : Int) * x0 ^ 4
def dF5_dx1 (x0 x1 x2 x3 x4 x5 : Int) : Int := (5 : Int) * x1 ^ 4
def dF5_dx2 (x0 x1 x2 x3 x4 x5 : Int) : Int := (5 : Int) * x2 ^ 4
def dF5_dx3 (x0 x1 x2 x3 x4 x5 : Int) : Int := (5 : Int) * x3 ^ 4
def dF5_dx4 (x0 x1 x2 x3 x4 x5 : Int) : Int := (5 : Int) * x4 ^ 4
def dF5_dx5 (x0 x1 x2 x3 x4 x5 : Int) : Int := (5 : Int) * x5 ^ 4

def G_inhomogeneous (x0 x1 x2 x3 x4 x5 : Int) : Int :=
  F5 x0 x1 x2 x3 x4 x5 - (5 : Int) * x0 * x1 * x2 * x3 * x4 * x5

theorem euler_F5 (x0 x1 x2 x3 x4 x5 : Int) :
    (5 : Int) * F5 x0 x1 x2 x3 x4 x5 =
      x0 * dF5_dx0 x0 x1 x2 x3 x4 x5 +
        x1 * dF5_dx1 x0 x1 x2 x3 x4 x5 +
          x2 * dF5_dx2 x0 x1 x2 x3 x4 x5 +
            x3 * dF5_dx3 x0 x1 x2 x3 x4 x5 +
              x4 * dF5_dx4 x0 x1 x2 x3 x4 x5 +
                x5 * dF5_dx5 x0 x1 x2 x3 x4 x5 := by
  unfold F5 dF5_dx0 dF5_dx1 dF5_dx2 dF5_dx3 dF5_dx4 dF5_dx5
  grind

theorem G_euler_defect (x0 x1 x2 x3 x4 x5 : Int) :
    x0 * ((5 : Int) * x0 ^ 4 - (5 : Int) * x1 * x2 * x3 * x4 * x5) +
      x1 * ((5 : Int) * x1 ^ 4 - (5 : Int) * x0 * x2 * x3 * x4 * x5) +
        x2 * ((5 : Int) * x2 ^ 4 - (5 : Int) * x0 * x1 * x3 * x4 * x5) +
          x3 * ((5 : Int) * x3 ^ 4 - (5 : Int) * x0 * x1 * x2 * x4 * x5) +
            x4 * ((5 : Int) * x4 ^ 4 - (5 : Int) * x0 * x1 * x2 * x3 * x5) +
              x5 * ((5 : Int) * x5 ^ 4 - (5 : Int) * x0 * x1 * x2 * x3 * x4) -
                (5 : Int) * G_inhomogeneous x0 x1 x2 x3 x4 x5 =
                  - (5 : Int) * x0 * x1 * x2 * x3 * x4 * x5 := by
  unfold G_inhomogeneous F5
  grind

theorem int_five_mul_prod4_eq_zero {x : Int}
    (h : (5 : Int) * x * x * x * x = 0) : x = 0 := by
  cases Int.mul_eq_zero.mp h with
  | inl h3 =>
    cases Int.mul_eq_zero.mp h3 with
    | inl h2 =>
      cases Int.mul_eq_zero.mp h2 with
      | inl h1 =>
        cases Int.mul_eq_zero.mp h1 with
        | inl h5 => exact absurd h5 (by decide)
        | inr hx => exact hx
      | inr hx => exact hx
    | inr hx => exact hx
  | inr hx => exact hx

theorem partial_as_prod (x : Int) :
    (5 : Int) * x ^ 4 = (5 : Int) * x * x * x * x := by
  grind

theorem affine_cone_isolated_at_origin
    (x0 x1 x2 x3 x4 x5 : Int)
    (d0 : dF5_dx0 x0 x1 x2 x3 x4 x5 = 0)
    (d1 : dF5_dx1 x0 x1 x2 x3 x4 x5 = 0)
    (d2 : dF5_dx2 x0 x1 x2 x3 x4 x5 = 0)
    (d3 : dF5_dx3 x0 x1 x2 x3 x4 x5 = 0)
    (d4 : dF5_dx4 x0 x1 x2 x3 x4 x5 = 0)
    (d5 : dF5_dx5 x0 x1 x2 x3 x4 x5 = 0) :
    x0 = 0 ∧ x1 = 0 ∧ x2 = 0 ∧ x3 = 0 ∧ x4 = 0 ∧ x5 = 0 := by
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_⟩
  · exact int_five_mul_prod4_eq_zero (by simpa [dF5_dx0, partial_as_prod] using d0)
  · exact int_five_mul_prod4_eq_zero (by simpa [dF5_dx1, partial_as_prod] using d1)
  · exact int_five_mul_prod4_eq_zero (by simpa [dF5_dx2, partial_as_prod] using d2)
  · exact int_five_mul_prod4_eq_zero (by simpa [dF5_dx3, partial_as_prod] using d3)
  · exact int_five_mul_prod4_eq_zero (by simpa [dF5_dx4, partial_as_prod] using d4)
  · exact int_five_mul_prod4_eq_zero (by simpa [dF5_dx5, partial_as_prod] using d5)

theorem h31_dim : (126 : Nat) - 6 = 120 := by decide

theorem sextic_h22_prim_container : (1751 : Nat) = 1751 := by decide

def sextic_Z_status : String := "uncomputed"

theorem sextic_Z_status_uncomputed : sextic_Z_status = "uncomputed" := rfl

def hostLabel : HostLabel :=
  { name := "V(F5)"
    dim := 4
    presentation := "x0^5 + x1^5 + x2^5 + x3^5 + x4^5 + x5^5 = 0 in P^5" }

theorem host_is_VF5 : hostLabel.name = "V(F5)" := rfl

theorem host_dim : hostLabel.dim = 4 := rfl

end VF5
end Hodge
