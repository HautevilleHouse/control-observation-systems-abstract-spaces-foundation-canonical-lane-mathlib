import ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean.AbstractSpaceObjects

namespace HautevilleHouse
namespace ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean

structure ReachabilityPackage where
  trajectorySpace : Type u
  timeDomain : Type v
  controlSet : Type w
  observationMap : trajectorySpace → observationSpaceType
  reachableSetDefined : Prop
  forwardInvariance : Prop
  backwardInvariance : Prop
  reachableSetClosedUnderControl : Prop

structure ReachabilityEvidence (R : ReachabilityPackage) where
  reachableSetDefinedClosed : R.reachableSetDefined
  forwardInvarianceClosed : R.forwardInvariance
  backwardInvarianceClosed : R.backwardInvariance
  reachableSetClosedUnderControlClosed : R.reachableSetClosedUnderControl

def ReachabilityClosed (R : ReachabilityPackage) : Prop :=
  R.reachableSetDefined ∧ R.forwardInvariance ∧ R.backwardInvariance ∧ R.reachableSetClosedUnderControl

theorem reachability_closed_from_evidence (R : ReachabilityPackage) (E : ReachabilityEvidence R) :
    ReachabilityClosed R := by
  exact And.intro E.reachableSetDefinedClosed
    (And.intro E.forwardInvarianceClosed
      (And.intro E.backwardInvarianceClosed
        E.reachableSetClosedUnderControlClosed))

end ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean
end HautevilleHouse
