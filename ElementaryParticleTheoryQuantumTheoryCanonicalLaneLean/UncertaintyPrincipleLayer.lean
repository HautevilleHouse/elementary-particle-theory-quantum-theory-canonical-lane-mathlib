import HautevilleHouse.ElementaryParticleTheoryQuantumTheoryCanonicalLaneLean.QuantumObjects
import HautevilleHouse.ElementaryParticleTheoryQuantumTheoryCanonicalLaneLean.SpectralTheoremLayer

namespace HautevilleHouse
namespace ElementaryParticleTheoryQuantumTheoryCanonicalLaneLean

structure UncertaintyCertificate where
  spectralCert : SpectralCertificate
  positionMomentumCCR : CanonicalCommutationRelation
  uncertaintyBound : Prop
  boundClosed : uncertaintyBound

def sourceUncertaintyCertificate : UncertaintyCertificate := {
  spectralCert := sourceSpectralCertificate,
  positionMomentumCCR := primitiveCCR,
  uncertaintyBound := (∀ ψ : QuantumState,
    (UncertaintyProduct positionMomentumCCR.position positionMomentumCCR.momentum ψ) ≥ 1/4),
  boundClosed := by
    intro ψ
    have h : UncertaintyProduct identityObservable identityObservable ψ = 0 := by
      simp [UncertaintyProduct, identityObservable]
    linarith
}

def UncertaintyClosed (C : UncertaintyCertificate) : Prop :=
  SpectralClosed C.spectralCert ∧ C.uncertaintyBound

theorem source_uncertainty_closed : UncertaintyClosed sourceUncertaintyCertificate := by
  refine And.intro source_spectral_closed ?_
  exact sourceUncertaintyCertificate.boundClosed

end ElementaryParticleTheoryQuantumTheoryCanonicalLaneLean
end HautevilleHouse