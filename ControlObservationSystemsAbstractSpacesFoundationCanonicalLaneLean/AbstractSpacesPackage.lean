import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ControlObservationSystemsAbstractSpacesFoundation.AbstractControlObservationSystem

namespace HautevilleHouse
namespace ControlObservationSystemsAbstractSpacesFoundation

structure AbstractSpacesPackage (C : AbstractControlSystem) (O : AbstractObservationSystem) where
  stateComplete : Prop
  inputComplete : Prop
  outputComplete : Prop
  observationComplete : Prop
  feedbackLoop : Prop

structure AbstractSpacesEvidence {C : AbstractControlSystem} {O : AbstractObservationSystem} (P : AbstractSpacesPackage C O) where
  stateCompleteClosed : P.stateComplete
  inputCompleteClosed : P.inputComplete
  outputCompleteClosed : P.outputComplete
  observationCompleteClosed : P.observationComplete
  feedbackLoopClosed : P.feedbackLoop

def AbstractSpacesClosed {C : AbstractControlSystem} {O : AbstractObservationSystem} (P : AbstractSpacesPackage C O) : Prop :=
  P.stateComplete ∧ P.inputComplete ∧ P.outputComplete ∧ P.observationComplete ∧ P.feedbackLoop

theorem abstract_spaces_closed_from_evidence
    {C : AbstractControlSystem} {O : AbstractObservationSystem}
    (P : AbstractSpacesPackage C O) (E : AbstractSpacesEvidence P) :
    AbstractSpacesClosed P := by
  exact And.intro E.stateCompleteClosed
    (And.intro E.inputCompleteClosed
      (And.intro E.outputCompleteClosed
        (And.intro E.observationCompleteClosed E.feedbackLoopClosed)))

end ControlObservationSystemsAbstractSpacesFoundation
end HautevilleHouse