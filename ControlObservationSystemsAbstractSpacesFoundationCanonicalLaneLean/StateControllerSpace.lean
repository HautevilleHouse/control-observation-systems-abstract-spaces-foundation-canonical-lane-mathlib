import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean

structure StateControllerSpace where
  stateSet : Type u
  controlSet : Type v
  observationSet : Type w
  stateTopology : TopologicalSpace stateSet
  controlTopology : TopologicalSpace controlSet
  observationTopology : TopologicalSpace observationSet
  transitionDynamics : stateSet × controlSet → stateSet
  observationMap : stateSet → observationSet
  continuousTransition : Prop
  continuousObservation : Prop
  controllable : Prop
  observable : Prop
  continuousTransitionTerm : continuousTransition
  continuousObservationTerm : continuousObservation
  controllableTerm : controllable
  observableTerm : observable

structure StateControllerSpaceEvidence (S : StateControllerSpace) where
  continuousTransitionClosed : S.continuousTransition
  continuousObservationClosed : S.continuousObservation
  controllableClosed : S.controllable
  observableClosed : S.observable

def StateControllerSpaceClosed (S : StateControllerSpace) : Prop :=
  S.continuousTransition ∧ S.continuousObservation ∧ S.controllable ∧ S.observable

theorem state_controller_space_closed_from_evidence (S : StateControllerSpace) (E : StateControllerSpaceEvidence S) : StateControllerSpaceClosed S := by
  exact And.intro E.continuousTransitionClosed (And.intro E.continuousObservationClosed (And.intro E.controllableClosed E.observableClosed))

end ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean
end HautevilleHouse