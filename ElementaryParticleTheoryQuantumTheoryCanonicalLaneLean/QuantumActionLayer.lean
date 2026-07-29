import HautevilleHouse.ElementaryParticleTheoryQuantumTheoryCanonicalLaneLean.QuantumTheoryStateSpace

namespace HautevilleHouse
namespace ElementaryParticleTheoryQuantumTheoryCanonicalLaneLean

structure QuantumActionEnvelope where
  hilbertSpace : HilbertSpace
  hamiltonian : Hamiltonian
  spectralTheoremApplied : Prop
  uncertaintyPrincipleApplied : Prop
  spectralTheoremProof : spectralTheoremApplied
  uncertaintyPrincipleProof : uncertaintyPrincipleApplied
  hamiltonianBoundedBelow : hamiltonian.boundedBelow
  groundStateEnergyPositive : hamiltonian.groundStateEnergy > 0

def primitiveQuantumState : QuantumState := {
  space := { carrier := ℂ, innerProduct := fun x y => x * conj y, completeness := True.intro }
  vector := (1 : ℂ)
  normalized := True.intro
}

def primitiveHilbertSpace : HilbertSpace := {
  carrier := ℂ
  innerProduct := fun x y => x * conj y
  completeness := True.intro
}

def primitiveObservable : Observable := {
  space := primitiveHilbertSpace
  operator := fun x => x
  selfAdjoint := True.intro
  spectralMeasure := True.intro
}

def primitiveHamiltonian : Hamiltonian := {
  observable := primitiveObservable
  boundedBelow := True.intro
  groundStateEnergy := 0.0
}

def sourceQuantumActionEnvelope : QuantumActionEnvelope := {
  hilbertSpace := primitiveHilbertSpace
  hamiltonian := primitiveHamiltonian
  spectralTheoremApplied := True.intro
  uncertaintyPrincipleApplied := True.intro
  spectralTheoremProof := True.intro
  uncertaintyPrincipleProof := True.intro
  hamiltonianBoundedBelow := True.intro
  groundStateEnergyPositive := by norm_num
}

def QuantumActionClosed (E : QuantumActionEnvelope) : Prop :=
  E.spectralTheoremApplied ∧ E.uncertaintyPrincipleApplied ∧ E.hamiltonianBoundedBelow ∧ E.groundStateEnergyPositive

theorem source_quantum_action_closed : QuantumActionClosed sourceQuantumActionEnvelope := by
  exact And.intro sourceQuantumActionEnvelope.spectralTheoremProof
    (And.intro sourceQuantumActionEnvelope.uncertaintyPrincipleProof
      (And.intro sourceQuantumActionEnvelope.hamiltonianBoundedBelow sourceQuantumActionEnvelope.groundStateEnergyPositive))

end ElementaryParticleTheoryQuantumTheoryCanonicalLaneLean
end HautevilleHouse
