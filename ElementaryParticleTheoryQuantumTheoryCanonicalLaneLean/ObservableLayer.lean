import Mathlib.Data.Real.Basic
import Mathlib.Analysis.InnerProductSpace.Basic

namespace HautevilleHouse
namespace ElementaryParticleTheoryQuantumTheoryCanonicalLaneLean

structure Observable where
  operator : ℂ → ℂ
  selfAdjoint : ∀ x : ℂ, conj (operator x) = operator (conj x)

def positionObservable (x0 : ℝ) : Observable := {
  operator := λ z => (x0 : ℂ) * z
  selfAdjoint := by
    intro z
    simp
}

def momentumObservable (p0 : ℝ) : Observable := {
  operator := λ z => (p0 : ℂ) * z
  selfAdjoint := by
    intro z
    simp
}

theorem observable_addition (O1 O2 : Observable) : Observable := {
  operator := λ z => O1.operator z + O2.operator z
  selfAdjoint := by
    intro z
    simp [O1.selfAdjoint, O2.selfAdjoint]
}

end ElementaryParticleTheoryQuantumTheoryCanonicalLaneLean
end HautevilleHouse
