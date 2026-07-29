import canonicalLaneMathlib.AdmissibleClass
import ElementaryParticleTheoryQuantumTheoryCanonicalLaneLean.QuantumStateSpaces
import ElementaryParticleTheoryQuantumTheoryCanonicalLaneLean.SpectralTheorem
import ElementaryParticleTheoryQuantumTheoryCanonicalLaneLean.UncertaintyPrinciple

namespace HautevilleHouse
namespace ElementaryParticleTheoryQuantumTheoryCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  NativeBridgeClosed A.object

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

def ConstrainedTheoremClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_quantum_closure (A : AdmissibleClass) :
    ConstrainedTheoremClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ElementaryParticleTheoryQuantumTheoryCanonicalLaneLean
end HautevilleHouse
