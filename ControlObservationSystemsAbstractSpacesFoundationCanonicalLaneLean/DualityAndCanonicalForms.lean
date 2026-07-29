import ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean.ControllabilityDecomposition

namespace HautevilleHouse
namespace ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean

structure DualityAndCanonicalFormsPackage where
  controllabilityObservabilityDuality : Prop
  canonicalReachableForm : Prop
  canonicalObservableForm : Prop
  kalmanDecompositionComplete : Prop

def DualityAndCanonicalFormsClosed (D : DualityAndCanonicalFormsPackage) : Prop :=
  D.controllabilityObservabilityDuality ∧ D.canonicalReachableForm ∧ D.canonicalObservableForm ∧ D.kalmanDecompositionComplete

structure DualityAndCanonicalFormsEvidence (D : DualityAndCanonicalFormsPackage) where
  controllabilityObservabilityDualityClosed : D.controllabilityObservabilityDuality
  canonicalReachableFormClosed : D.canonicalReachableForm
  canonicalObservableFormClosed : D.canonicalObservableForm
  kalmanDecompositionCompleteClosed : D.kalmanDecompositionComplete

theorem duality_and_canonical_forms_closed_from_evidence (D : DualityAndCanonicalFormsPackage) (E : DualityAndCanonicalFormsEvidence D) :
    DualityAndCanonicalFormsClosed D := by
  exact And.intro E.controllabilityObservabilityDualityClosed
    (And.intro E.canonicalReachableFormClosed
      (And.intro E.canonicalObservableFormClosed
        E.kalmanDecompositionCompleteClosed))

end ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean
end HautevilleHouse
