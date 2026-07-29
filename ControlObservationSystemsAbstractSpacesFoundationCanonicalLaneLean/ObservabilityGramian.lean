import canonicalLaneMathlib.AdmissibleClass
import Mathlib.LinearAlgebra.Matrix.Determinant

namespace HautevilleHouse
namespace ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean

open Matrix

structure ObservabilityGramianPackage {S : StateSpacePackage} where
  gramianMatrix : Matrix (Fin n) (Fin n) ℝ
  rankCondition : Prop
  positiveDefinite : Prop
  observabilityIndex : ℕ

structure ObservabilityGramianEvidence
    {S : StateSpacePackage} (G : ObservabilityGramianPackage S) where
  rankConditionClosed : G.rankCondition
  positiveDefiniteClosed : G.positiveDefinite

def ObservabilityGramianClosed {S : StateSpacePackage} (G : ObservabilityGramianPackage S) : Prop :=
  G.rankCondition ∧ G.positiveDefinite

theorem observability_gramian_closed_from_evidence
    {S : StateSpacePackage} (G : ObservabilityGramianPackage S)
    (E : ObservabilityGramianEvidence G) : ObservabilityGramianClosed G := by
  exact And.intro E.rankConditionClosed E.positiveDefiniteClosed

end ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean
end HautevilleHouse