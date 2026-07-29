import canonicalLaneMathlib.AdmissibleClass
import Mathlib.LinearAlgebra.Matrix.Determinant

namespace HautevilleHouse
namespace ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean

open Matrix

structure ControllabilityGramianPackage {S : StateSpacePackage} where
  gramianMatrix : Matrix (Fin m) (Fin m) ℝ
  rankCondition : Prop
  positiveDefinite : Prop
  controllabilityIndex : ℕ

structure ControllabilityGramianEvidence
    {S : StateSpacePackage} (G : ControllabilityGramianPackage S) where
  rankConditionClosed : G.rankCondition
  positiveDefiniteClosed : G.positiveDefinite

def ControllabilityGramianClosed {S : StateSpacePackage} (G : ControllabilityGramianPackage S) : Prop :=
  G.rankCondition ∧ G.positiveDefinite

theorem controllability_gramian_closed_from_evidence
    {S : StateSpacePackage} (G : ControllabilityGramianPackage S)
    (E : ControllabilityGramianEvidence G) : ControllabilityGramianClosed G := by
  exact And.intro E.rankConditionClosed E.positiveDefiniteClosed

end ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean
end HautevilleHouse