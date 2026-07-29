import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean.SystemDynamics
import HautevilleHouse.ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean.ObservationModel

namespace HautevilleHouse
namespace ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean

structure ObservabilityCondition (S : AbstractStateSpace) (O : AbstractObservationSpace)
  (D : SystemDynamicsPackage S C) (M : ObservationModel S O) where
  distinguishable : ∀ (x y : S.carrier), x ≠ y → ∃ n : ℕ, 
    M.observationHistory n x ≠ M.observationHistory n y
  observabilityGramian : Type u
  gramianRankFull : Prop

structure ControllabilityCondition (S : AbstractStateSpace) (C : AbstractControlSpace)
  (D : SystemDynamicsPackage S C) where
  reachableSet : Set S.carrier
  reachableFromAny : ∀ (x : S.carrier), x ∈ reachableSet
  controllabilityGramian : Type u
  gramianRankFull : Prop

structure ObservabilityControllabilityPackage (S : AbstractStateSpace) (O : AbstractObservationSpace)
  (C : AbstractControlSpace) (D : SystemDynamicsPackage S C) (M : ObservationModel S O) where
  observability : ObservabilityCondition S O D M
  controllability : ControllabilityCondition S C D
  dualityGap : Prop

def ObservabilityControllabilityClosed (S : AbstractStateSpace) (O : AbstractObservationSpace)
  (C : AbstractControlSpace) (D : SystemDynamicsPackage S C) (M : ObservationModel S O)
  (P : ObservabilityControllabilityPackage S O C D M) : Prop :=
  P.observability.distinguishable ∧ P.controllability.reachableFromAny

theorem observability_controllability_closed (S : AbstractStateSpace) (O : AbstractObservationSpace)
  (C : AbstractControlSpace) (D : SystemDynamicsPackage S C) (M : ObservationModel S O)
  (P : ObservabilityControllabilityPackage S O C D M) :
  ObservabilityControllabilityClosed S O C D M P :=
  And.intro P.observability.distinguishable P.controllability.reachableFromAny

end ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean
end HautevilleHouse
