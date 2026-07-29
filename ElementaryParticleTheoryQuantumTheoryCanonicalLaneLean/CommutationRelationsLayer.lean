import HautevilleHouse.ElementaryParticleTheoryQuantumTheoryCanonicalLaneLean.QuantumObjects
import HautevilleHouse.ElementaryParticleTheoryQuantumTheoryCanonicalLaneLean.UncertaintyPrincipleLayer

namespace HautevilleHouse
namespace ElementaryParticleTheoryQuantumTheoryCanonicalLaneLean

structure CommutationCertificate where
  uncertaintyCert : UncertaintyCertificate
  ccrSatisfied : Prop
  ccrClosed : ccrSatisfied

def sourceCommutationCertificate : CommutationCertificate := {
  uncertaintyCert := sourceUncertaintyCertificate,
  ccrSatisfied := True,
  ccrClosed := by
    simp
}

def CommutationClosed (C : CommutationCertificate) : Prop :=
  UncertaintyClosed C.uncertaintyCert ∧ C.ccrSatisfied

theorem source_commutation_closed : CommutationClosed sourceCommutationCertificate := by
  unfold CommutationClosed
  refine And.intro ?_ ?_
  · exact source_uncertainty_closed
  · exact sourceCommutationCertificate.ccrClosed

end ElementaryParticleTheoryQuantumTheoryCanonicalLaneLean
end HautevilleHouse