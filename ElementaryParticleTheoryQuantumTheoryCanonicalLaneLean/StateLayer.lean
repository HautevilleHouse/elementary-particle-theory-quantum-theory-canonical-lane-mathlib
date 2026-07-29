import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace ElementaryParticleTheoryQuantumTheoryCanonicalLaneLean

structure State where
  density : ℂ → ℂ
  traceOne : ∫ x : ℂ, density x = 1
  positivity : ∀ x : ℂ, 0 ≤ re (density x)

def pureState (x0 : ℂ) : State := {
  density := λ x => if x = x0 then 1 else 0
  traceOne := by
    -- integration over a single point yields 1
    simp [integral_ite_eq_left, set_integral_eq_integral_of_support_subset]
  positivity := by
    intro x
    split
    · simp
    · simp
}

theorem state_mixture (p : ℝ) (S1 S2 : State) (h : 0 ≤ p ∧ p ≤ 1) : State := {
  density := λ x => (p : ℂ) * S1.density x + ((1-p : ℝ) : ℂ) * S2.density x
  traceOne := by
    simp [integral_add, integral_mul_const, S1.traceOne, S2.traceOne]
  positivity := by
    intro x
    have h1 := S1.positivity x
    have h2 := S2.positivity x
    have hre1 : 0 ≤ re ((p : ℂ) * S1.density x) := by
      have : 0 ≤ p := h.left
      have hp_nonneg : 0 ≤ (p : ℝ) := this
      have hre_density1 : 0 ≤ re (S1.density x) := h1
      nlinarith [re_mul_ofReal (S1.density x) p]
    have hre2 : 0 ≤ re (((1-p : ℝ) : ℂ) * S2.density x) := by
      have hp_le_one : p ≤ 1 := h.right
      have hp_nonneg' : (1-p : ℝ) ≥ 0 := by linarith
      have hre_density2 : 0 ≤ re (S2.density x) := h2
      nlinarith [re_mul_ofReal (S2.density x) (1-p)]
    have : re (((p : ℂ) * S1.density x) + (((1-p : ℝ) : ℂ) * S2.density x)) = re ((p : ℂ) * S1.density x) + re (((1-p : ℝ) : ℂ) * S2.density x) := by
      simp
    rw [this]
    nlinarith
}

end ElementaryParticleTheoryQuantumTheoryCanonicalLaneLean
end HautevilleHouse