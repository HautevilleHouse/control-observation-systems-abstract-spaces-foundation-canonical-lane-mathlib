import ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean.ObservabilityGramian

namespace HautevilleHouse
namespace ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean

structure ControllabilityDecompositionPackage where
  controllableSubspace : Prop
  uncontrollableSubspace : Prop
  decompositionExists : Prop
  kalmanRankCondition : Prop
  stabilizabilityCondition : Prop

structure ControllabilityDecompositionEvidence (C : ControllabilityDecompositionPackage) where
  controllableSubspaceClosed : C.controllableSubspace
  uncontrollableSubspaceClosed : C.uncontrollableSubspace
  decompositionExistsClosed : C.decompositionExists
  kalmanRankConditionClosed : C.kalmanRankCondition
  stabilizabilityConditionClosed : C.stabilizabilityCondition

def ControllabilityDecompositionClosed (C : ControllabilityDecompositionPackage) : Prop :=
  C.controllableSubspace ∧ C.uncontrollableSubspace ∧ C.decompositionExists ∧ C.kalmanRankCondition ∧ C.stabilizabilityCondition

theorem controllability_decomposition_closed_from_evidence (C : ControllabilityDecompositionPackage) (E : ControllabilityDecompositionEvidence C) :
    ControllabilityDecompositionClosed C := by
  exact And.intro E.controllableSubspaceClosed
    (And.intro E.uncontrollableSubspaceClosed
      (And.intro E.decompositionExistsClosed
        (And.intro E.kalmanRankConditionClosed E.stabilizabilityConditionClosed)))

end ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean
end HautevilleHouse
