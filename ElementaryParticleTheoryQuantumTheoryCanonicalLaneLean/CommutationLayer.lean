import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace ElementaryParticleTheoryQuantumTheoryCanonicalLaneLean

structure CommutationRelation where
  operatorA : Observable
  operatorB : Observable
  commutator : Observable
  holds : ∀ ψ : Qubit, (commutator.operator) ψ = (operatorA.operator ∘ operatorB.operator) ψ - (operatorB.operator ∘ operatorA.operator) ψ

def canonicalCommutation (x : ℝ) (p : ℝ) : CommutationRelation := {
  operatorA := positionObservable x
  operatorB := momentumObservable p
  commutator := {
    operator := λ z => ((x : ℂ) * (p : ℂ) - (p : ℂ) * (x : ℂ)) * z
    selfAdjoint := by
      intro z
      simp
  }
  holds := by
    intro ψ
    ext <;> simp
}

theorem commutator_antisymm (c : CommutationRelation) :
    c.commutator.operator = - (c.commutator.operator) := by
  ext z
  calc
    c.commutator.operator z = (c.operatorA.operator ∘ c.operatorB.operator) z - (c.operatorB.operator ∘ c.operatorA.operator) z := by
      simpa using c.holds z
    _ = -((c.operatorB.operator ∘ c.operatorA.operator) z - (c.operatorA.operator ∘ c.operatorB.operator) z) := by ring
    _ = -(c.commutator.operator z) := by
      simpa [c.holds z] using rfl

end ElementaryParticleTheoryQuantumTheoryCanonicalLaneLean
end HautevilleHouse
