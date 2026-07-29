import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean

structure ControllerPackage {S : StateSpacePackage} where
  controlLaw : S.stateType → S.controlType
  closedLoopDynamics : S.stateType → S.stateType
  stabilityCondition : Prop
  performanceSpec : Prop
  robustnessMargin : Prop

structure ControllerEvidence {S : StateSpacePackage} (C : ControllerPackage S) where
  stabilityConditionClosed : C.stabilityCondition
  performanceSpecClosed : C.performanceSpec
  robustnessMarginClosed : C.robustnessMargin

def ControllerClosed {S : StateSpacePackage} (C : ControllerPackage S) : Prop :=
  C.stabilityCondition ∧ C.performanceSpec ∧ C.robustnessMargin

theorem controller_closed_from_evidence {S : StateSpacePackage} (C : ControllerPackage S)
    (E : ControllerEvidence C) : ControllerClosed C := by
  exact And.intro E.stabilityConditionClosed
    (And.intro E.performanceSpecClosed E.robustnessMarginClosed)

end ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean
end HautevilleHouse