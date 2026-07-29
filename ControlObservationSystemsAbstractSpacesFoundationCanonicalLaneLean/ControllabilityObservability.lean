import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ControlObservationSystemsAbstractSpacesFoundation.AbstractSpacesPackage

namespace HautevilleHouse
namespace ControlObservationSystemsAbstractSpacesFoundation

structure ControllabilityPackage {C : AbstractControlSystem} {O : AbstractObservationSystem}
    (P : AbstractSpacesPackage C O) where
  reachableSet : Set C.stateSpace
  controllabilityGramian : Matrix ℝ C.stateSpace C.stateSpace
  controllabilityCondition : Prop

structure ObservabilityPackage {C : AbstractControlSystem} {O : AbstractObservationSystem}
    (P : AbstractSpacesPackage C O) where
  unobservableSubspace : Set C.stateSpace
  observabilityGramian : Matrix ℝ C.stateSpace C.outputSpace
  observabilityCondition : Prop

structure ControllabilityEvidence {C : AbstractControlSystem} {O : AbstractObservationSystem}
    {P : AbstractSpacesPackage C O} (Cpkg : ControllabilityPackage P) where
  reachableSetClosed : Cpkg.reachableSet = Set.univ
  controllabilityConditionClosed : Cpkg.controllabilityCondition

structure ObservabilityEvidence {C : AbstractControlSystem} {O : AbstractObservationSystem}
    {P : AbstractSpacesPackage C O} (Opkg : ObservabilityPackage P) where
  unobservableSubspaceClosed : Opkg.unobservableSubspace = {0}
  observabilityConditionClosed : Opkg.observabilityCondition

def ControllabilityClosed {C : AbstractControlSystem} {O : AbstractObservationSystem}
    {P : AbstractSpacesPackage C O} (Cpkg : ControllabilityPackage P) : Prop :=
  Cpkg.reachableSet = Set.univ ∧ Cpkg.controllabilityCondition

def ObservabilityClosed {C : AbstractControlSystem} {O : AbstractObservationSystem}
    {P : AbstractSpacesPackage C O} (Opkg : ObservabilityPackage P) : Prop :=
  Opkg.unobservableSubspace = {0} ∧ Opkg.observabilityCondition

theorem controllability_closed_from_evidence
    {C : AbstractControlSystem} {O : AbstractObservationSystem}
    {P : AbstractSpacesPackage C O} (Cpkg : ControllabilityPackage P)
    (E : ControllabilityEvidence Cpkg) : ControllabilityClosed Cpkg := by
  exact And.intro E.reachableSetClosed E.controllabilityConditionClosed

theorem observability_closed_from_evidence
    {C : AbstractControlSystem} {O : AbstractObservationSystem}
    {P : AbstractSpacesPackage C O} (Opkg : ObservabilityPackage P)
    (E : ObservabilityEvidence Opkg) : ObservabilityClosed Opkg := by
  exact And.intro E.unobservableSubspaceClosed E.observabilityConditionClosed

end ControlObservationSystemsAbstractSpacesFoundation
end HautevilleHouse