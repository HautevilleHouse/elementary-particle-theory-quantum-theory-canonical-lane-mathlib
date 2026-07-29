import HautevilleHouse.ElementaryParticleTheoryQuantumTheoryCanonicalLaneLean.QuantumActionLayer

namespace HautevilleHouse
namespace ElementaryParticleTheoryQuantumTheoryCanonicalLaneLean

structure QuantumAnalyticCertificate where
  substrate : QuantumSubstrate
  actionLayerClosed : Prop
  actionLayerClosedProof : actionLayerClosed

def sourceQuantumAnalyticCertificate : QuantumAnalyticCertificate := {
  substrate := quantumSubstrate
  actionLayerClosed := QuantumActionClosed sourceQuantumActionEnvelope
  actionLayerClosedProof := source_quantum_action_closed
}

def QuantumAnalyticCertificateClosed (C : QuantumAnalyticCertificate) : Prop :=
  C.actionLayerClosed

theorem source_quantum_analytic_certificate_closed : QuantumAnalyticCertificateClosed sourceQuantumAnalyticCertificate := by
  exact sourceQuantumAnalyticCertificate.actionLayerClosedProof

end ElementaryParticleTheoryQuantumTheoryCanonicalLaneLean
end HautevilleHouse
