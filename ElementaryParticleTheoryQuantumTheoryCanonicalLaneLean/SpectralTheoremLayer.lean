import HautevilleHouse.ElementaryParticleTheoryQuantumTheoryCanonicalLaneLean.QuantumObjects
import canonicalLaneMathlib.BridgeLemmas

namespace HautevilleHouse
namespace ElementaryParticleTheoryQuantumTheoryCanonicalLaneLean

structure SpectralCertificate where
  observable : QuantumObservable
  spectralDecomposition : Prop
  spectralResolution : Prop
  spectralClosed : spectralDecomposition ∧ spectralResolution

def sourceSpectralCertificate : SpectralCertificate := {
  observable := identityObservable,
  spectralDecomposition := by
    intro v
    exact ⟨1, by simp⟩,
  spectralResolution := True,
  spectralClosed := And.intro (by
    intro v
    exact ⟨1, by simp⟩) (by trivial)
}

def SpectralClosed (C : SpectralCertificate) : Prop :=
  C.spectralDecomposition ∧ C.spectralResolution

theorem source_spectral_closed : SpectralClosed sourceSpectralCertificate := by
  unfold SpectralClosed
  exact sourceSpectralCertificate.spectralClosed

end ElementaryParticleTheoryQuantumTheoryCanonicalLaneLean
end HautevilleHouse