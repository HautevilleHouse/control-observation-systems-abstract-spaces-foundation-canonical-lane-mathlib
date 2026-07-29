import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ControlObservationSystemsAbstractSpacesFoundation.AbstractControlObservationSystem

namespace HautevilleHouse
namespace ControlObservationSystemsAbstractSpacesFoundation

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ∃ (C : AbstractControlSystem) (O : AbstractObservationSystem),
    AdmissibleControlObservationPair C O

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  -- Placeholder: in a full development, this would extract the pair from A
  exact ⟨A.object.space, A.object.space, sorry⟩

end ControlObservationSystemsAbstractSpacesFoundation
end HautevilleHouse