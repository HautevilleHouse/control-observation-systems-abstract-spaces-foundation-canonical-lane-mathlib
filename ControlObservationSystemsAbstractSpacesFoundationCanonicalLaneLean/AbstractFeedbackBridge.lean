import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean.StateControllerSpace

namespace HautevilleHouse
namespace ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean

structure AbstractFeedbackBridge (S : StateControllerSpace) where
  feedbackLaw : S.observationSet → S.controlSet
  feedbackContinuous : Prop
  closedLoopDynamics : S.stateSet → S.stateSet
  closedLoopContinuous : Prop
  stabilityCondition : Prop
  feedbackContinuousTerm : feedbackContinuous
  closedLoopContinuousTerm : closedLoopContinuous
  stabilityConditionTerm : stabilityCondition

structure AbstractFeedbackEvidence {S : StateControllerSpace} (F : AbstractFeedbackBridge S) where
  feedbackContinuousClosed : F.feedbackContinuous
  closedLoopContinuousClosed : F.closedLoopContinuous
  stabilityConditionClosed : F.stabilityCondition

def AbstractFeedbackClosed {S : StateControllerSpace} (F : AbstractFeedbackBridge S) : Prop :=
  F.feedbackContinuous ∧ F.closedLoopContinuous ∧ F.stabilityCondition

theorem abstract_feedback_closed_from_evidence {S : StateControllerSpace} (F : AbstractFeedbackBridge S) (E : AbstractFeedbackEvidence F) : AbstractFeedbackClosed F := by
  exact And.intro E.feedbackContinuousClosed (And.intro E.closedLoopContinuousClosed E.stabilityConditionClosed)

end ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean
end HautevilleHouse