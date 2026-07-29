import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean.ObservationSpace

namespace HautevilleHouse
namespace ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean

structure ControlSystem (Ω : Type u) (U : Type v) where
  stateSpace : ObservationSpace Ω
  controlSpace : Set U
  dynamics : Ω × U → Ω

structure ControlSystemPackage {Ω : Type u} {U : Type v} (C : ControlSystem Ω U) where
  dynamicsContinuous : Prop
  controlSpaceCompact : Prop
  wellPosed : Prop

structure ControlSystemEvidence {Ω : Type u} {U : Type v} {C : ControlSystem Ω U} (P : ControlSystemPackage C) where
  dynamicsContinuousClosed : P.dynamicsContinuous
  controlSpaceCompactClosed : P.controlSpaceCompact
  wellPosedClosed : P.wellPosed

def ControlSystemClosed {Ω : Type u} {U : Type v} {C : ControlSystem Ω U} (P : ControlSystemPackage C) : Prop :=
  P.dynamicsContinuous ∧ P.controlSpaceCompact ∧ P.wellPosed

theorem control_system_closed_from_evidence
    {Ω : Type u} {U : Type v} {C : ControlSystem Ω U} (P : ControlSystemPackage C)
    (E : ControlSystemEvidence P) : ControlSystemClosed P := by
  exact And.intro E.dynamicsContinuousClosed
    (And.intro E.controlSpaceCompactClosed E.wellPosedClosed)

end ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean
end HautevilleHouse