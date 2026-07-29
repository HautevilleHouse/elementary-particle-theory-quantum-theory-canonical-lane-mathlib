import canonicalLaneMathlib.MathlibObjects
import Mathlib.Data.Real.Basic
import Mathlib.Analysis.InnerProductSpace.Basic

namespace HautevilleHouse
namespace ElementaryParticleTheoryQuantumTheoryCanonicalLaneLean

abbrev HilbertSpace := EuclideanSpace ℝ (Fin 3)  -- simplified model
abbrev Observable := HilbertSpace → ℝ
abbrev State : Type := HilbertSpace

structure QuantumState where
  vector : HilbertSpace
  normSquared : ℝ
  normSquaredEqOne : normSquared = 1

def zeroState : QuantumState := {
  vector := 0,
  normSquared := 0,
  normSquaredEqOne := by norm_num
}

structure QuantumObservable where
  operator : HilbertSpace → HilbertSpace
  selfAdjoint : ∀ v w, inner (operator v) w = inner v (operator w)

def identityObservable : QuantumObservable := {
  operator := fun v => v,
  selfAdjoint := by intro v w; simp
}

structure CanonicalCommutationRelation where
  position : QuantumObservable
  momentum : QuantumObservable
  commutator : (position ∘ momentum) - (momentum ∘ position) = fun _ => 0

def primitiveCCR : CanonicalCommutationRelation := {
  position := identityObservable,
  momentum := identityObservable,
  commutator := by ext; simp
}

def SpectralDecomposition (A : QuantumObservable) : Prop :=
  ∀ v : HilbertSpace, ∃ (eigenvalue : ℝ), A.operator v = eigenvalue • v

def UncertaintyProduct (A B : QuantumObservable) (ψ : QuantumState) : ℝ :=
  realPart (inner (A.operator ψ.vector) (B.operator ψ.vector)) -
    realPart (inner ψ.vector (A.operator ψ.vector) * inner ψ.vector (B.operator ψ.vector))

end ElementaryParticleTheoryQuantumTheoryCanonicalLaneLean
end HautevilleHouse