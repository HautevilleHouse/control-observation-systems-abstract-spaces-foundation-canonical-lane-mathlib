import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean.AbstractStateSpace

namespace HautevilleHouse
namespace ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean

structure ControlLaw (S : AbstractStateSpace) (O : AbstractObservationSpace) (C : AbstractControlSpace) where
  policy : List O.carrier → C.carrier
  policyMeasurable : Measurable policy
  feedbackType : Prop
  admissible : Set (List O.carrier)

structure ControlLawEvidence (S : AbstractStateSpace) (O : AbstractObservationSpace) (C : AbstractControlSpace)
  (L : ControlLaw S O C) where
  policyMeasurableClosed : L.policyMeasurable
  feedbackTypeClosed : L.feedbackType
  admissibleClosed : ∀ (h : List O.carrier), h ∈ L.admissible → L.policy h ∈ C.carrier

def ControlLawClosed (S : AbstractStateSpace) (O : AbstractObservationSpace) (C : AbstractControlSpace)
  (L : ControlLaw S O C) : Prop :=
  L.policyMeasurable ∧ L.feedbackType

theorem control_law_closed_from_evidence (S : AbstractStateSpace) (O : AbstractObservationSpace) (C : AbstractControlSpace)
  (L : ControlLaw S O C) (E : ControlLawEvidence S O C L) : ControlLawClosed S O C L :=
  And.intro E.policyMeasurableClosed E.feedbackTypeClosed

end ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean
end HautevilleHouse
