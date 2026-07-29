import Mathlib.Data.Real.Basic
import Mathlib.Analysis.InnerProductSpace.Basic

namespace HautevilleHouse
namespace ElementaryParticleTheoryQuantumTheoryCanonicalLaneLean

structure HilbertSpace where
  carrier : Type
  innerProduct : carrier → carrier → ℂ
  innerSelfNonneg : ∀ x : carrier, 0 ≤ re (innerProduct x x)
  innerSelfZero : ∀ x : carrier, innerProduct x x = 0 → x = 0
  completeness : ∀ s : Set carrier, CauchySequence s → ∃ x : carrier, s → x

structure Qubit where
  alpha : ℂ
  beta : ℂ
  normalization : ‖alpha‖^2 + ‖beta‖^2 = 1

def standardBasisQubit0 : Qubit := {
  alpha := 1
  beta := 0
  normalization := by
    have h1 : ‖(1 : ℂ)‖ = 1 := by simp
    have h2 : ‖(0 : ℂ)‖ = 0 := by simp
    calc
      ‖(1 : ℂ)‖^2 + ‖(0 : ℂ)‖^2 = 1^2 + 0^2 := by simp
      _ = 1 := by norm_num
}

def standardBasisQubit1 : Qubit := {
  alpha := 0
  beta := 1
  normalization := by
    have h1 : ‖(0 : ℂ)‖ = 0 := by simp
    have h2 : ‖(1 : ℂ)‖ = 1 := by simp
    calc
      ‖(0 : ℂ)‖^2 + ‖(1 : ℂ)‖^2 = 0^2 + 1^2 := by simp
      _ = 1 := by norm_num
}

theorem qubit_linear_combination (a b : ℂ) (q1 q2 : Qubit) : ℂ × ℂ := (a*q1.alpha + b*q2.alpha, a*q1.beta + b*q2.beta)

end ElementaryParticleTheoryQuantumTheoryCanonicalLaneLean
end HautevilleHouse