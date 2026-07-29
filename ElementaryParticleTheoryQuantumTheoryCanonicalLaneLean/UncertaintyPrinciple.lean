import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElementaryParticleTheoryQuantumTheoryCanonicalLaneLean

/-!
# Heisenberg Uncertainty Principle

This module states the uncertainty principle and its admissible bridge.
-/

structure Commutator (H : HilbertSpace) where
  A : Observable H
  B : Observable H
  commutator : H → H
  commutatorDefined : ∀ ψ : H, commutator ψ = (A ∘ B) ψ - (B ∘ A) ψ

structure UncertaintyState (H : HilbertSpace) where
  state : StateVector H
  varianceA : ℝ
  varianceB : ℝ
  uncertaintyProduct : ℝ
  uncertaintyInequality : varianceA * varianceB ≥ (1/4) * |commutator state|^2

theorem heisenberg_uncertainty (H : HilbertSpace) (A B : Observable H) (ψ : StateVector H) :
    (variance A ψ) * (variance B ψ) ≥ (1/4) * |⟨ψ, [A,B] ψ⟩|^2 := by
  sorry

end ElementaryParticleTheoryQuantumTheoryCanonicalLaneLean
end HautevilleHouse
