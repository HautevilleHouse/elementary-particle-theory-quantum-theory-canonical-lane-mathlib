import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElementaryParticleTheoryQuantumTheoryCanonicalLaneLean

structure HilbertSpace where
  carrier : Type
  innerProduct : carrier → carrier → ℂ
  completeness : Prop

structure QuantumState where
  space : HilbertSpace
  vector : space.carrier
  normalized : Prop

structure Observable where
  space : HilbertSpace
  operator : space.carrier → space.carrier
  selfAdjoint : Prop
  spectralMeasure : Prop

structure Hamiltonian where
  observable : Observable
  boundedBelow : Prop
  groundStateEnergy : ℝ

structure CommutationRelation where
  A : Observable
  B : Observable
  commutator : (A.space.carrier → A.space.carrier)
  canonicalCommutation : Prop

end ElementaryParticleTheoryQuantumTheoryCanonicalLaneLean
end HautevilleHouse
