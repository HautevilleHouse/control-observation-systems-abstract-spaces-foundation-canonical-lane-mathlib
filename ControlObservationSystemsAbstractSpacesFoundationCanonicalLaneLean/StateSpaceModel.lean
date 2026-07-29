import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean

structure StateSpacePackage where
  stateType : Type u
  observationType : Type v
  controlType : Type w
  dynamics : stateType → controlType → stateType
  outputMap : stateType → observationType
  stateReachable : Prop
  observableSubspace : Prop
  controllableSubspace : Prop

structure StateSpaceEvidence (S : StateSpacePackage) where
  stateReachableClosed : S.stateReachable
  observableSubspaceClosed : S.observableSubspace
  controllableSubspaceClosed : S.controllableSubspace

def StateSpaceClosed (S : StateSpacePackage) : Prop :=
  S.stateReachable ∧ S.observableSubspace ∧ S.controllableSubspace

theorem state_space_closed_from_evidence (S : StateSpacePackage) (E : StateSpaceEvidence S) :
    StateSpaceClosed S := by
  exact And.intro E.stateReachableClosed
    (And.intro E.observableSubspaceClosed E.controllableSubspaceClosed)

end ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean
end HautevilleHouse