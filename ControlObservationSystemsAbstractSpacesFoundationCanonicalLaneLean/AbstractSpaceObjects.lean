import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean

structure ControlObservationSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure ControlObservationAdmittedObject where
  space : ControlObservationSpace
  abstractControlSystem : Prop
  observationMapping : Prop
  reachableSet : Prop
  conclusion : reachableSet

structure ControlObservationEndgameState where
  object : ControlObservationAdmittedObject

def ControlObservationWitnessClosed (O : ControlObservationAdmittedObject) : Prop :=
  O.reachableSet

end ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean
end HautevilleHouse
