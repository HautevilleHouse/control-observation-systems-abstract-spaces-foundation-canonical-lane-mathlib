import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean.ControlSystem

namespace HautevilleHouse
namespace ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean

structure Controllability (Ω : Type u) (U : Type v) where
  system : ControlSystem Ω U
  reachableSet : Set Ω
  controllabilityCondition : Prop

structure ControllabilityPackage {Ω : Type u} {U : Type v} (C : Controllability Ω U) where
  reachableSetClosed : C.reachableSet ∈ C.system.stateSpace.sigmaAlgebra
  controllabilityConditionClosed : C.controllabilityCondition

structure ControllabilityEvidence {Ω : Type u} {U : Type v} {C : Controllability Ω U} (P : ControllabilityPackage C) where
  reachableSetClosed : P.reachableSetClosed
  controllabilityConditionClosed : P.controllabilityConditionClosed

def ControllabilityClosed {Ω : Type u} {U : Type v} {C : Controllability Ω U} (P : ControllabilityPackage C) : Prop :=
  P.reachableSetClosed ∧ P.controllabilityConditionClosed

theorem controllability_closed_from_evidence
    {Ω : Type u} {U : Type v} {C : Controllability Ω U} (P : ControllabilityPackage C)
    (E : ControllabilityEvidence P) : ControllabilityClosed P := by
  exact And.intro E.reachableSetClosed E.controllabilityConditionClosed

end ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean
end HautevilleHouse