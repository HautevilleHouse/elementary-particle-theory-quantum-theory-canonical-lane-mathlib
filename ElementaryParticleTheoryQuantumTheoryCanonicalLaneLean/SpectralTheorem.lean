import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElementaryParticleTheoryQuantumTheoryCanonicalLaneLean

/-!
# Spectral Theorem

This module encodes the spectral theorem for self-adjoint operators and its
admissible bridge closure.
-/

structure SelfAdjointOperator (H : HilbertSpace) where
  domain : Set H
  action : H → H
  selfAdjoint : ∀ ψ φ ∈ domain, innerProduct ψ (action φ) = innerProduct (action ψ) φ

structure SpectralMeasure (H : HilbertSpace) where
  spectrum : Set ℝ
  projectionValuedMeasure : ℝ → H → H
  spectralDecomposition : (A : SelfAdjointOperator H) → (∀ ψ : H, ∫_ℝ λ d⟨ψ, P(dλ) ψ⟩ = innerProduct ψ (A.action ψ))

theorem spectral_theorem_admissible (A : SelfAdjointOperator H) :
    ∃ (μ : SpectralMeasure H), spectralDecomposition A μ := by
  sorry

end ElementaryParticleTheoryQuantumTheoryCanonicalLaneLean
end HautevilleHouse
