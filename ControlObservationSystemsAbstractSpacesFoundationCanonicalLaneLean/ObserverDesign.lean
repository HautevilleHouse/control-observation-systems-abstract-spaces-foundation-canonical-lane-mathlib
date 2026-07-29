import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean

structure ObserverPackage {S : StateSpacePackage} where
  observerDynamics : S.stateType → S.observationType → S.stateType
  gainMatrix : S.stateType → S.stateType
  estimationErrorDynamics : Prop
  convergenceCondition : Prop
  stabilityMargin : Prop

structure ObserverEvidence {S : StateSpacePackage} (O : ObserverPackage S) where
  estimationErrorDynamicsClosed : O.estimationErrorDynamics
  convergenceConditionClosed : O.convergenceCondition
  stabilityMarginClosed : O.stabilityMargin

def ObserverClosed {S : StateSpacePackage} (O : ObserverPackage S) : Prop :=
  O.estimationErrorDynamics ∧ O.convergenceCondition ∧ O.stabilityMargin

theorem observer_closed_from_evidence {S : StateSpacePackage} (O : ObserverPackage S)
    (E : ObserverEvidence O) : ObserverClosed O := by
  exact And.intro E.estimationErrorDynamicsClosed
    (And.intro E.convergenceConditionClosed E.stabilityMarginClosed)

end ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean
end HautevilleHouse