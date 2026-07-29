import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlObservationSystemsAbstractSpacesFoundation

structure AbstractControlSystem where
  stateSpace : Type u
  inputSpace : Type v
  outputSpace : Type w
  dynamics : stateSpace → inputSpace → stateSpace
  observationMap : stateSpace → outputSpace
  controlLaw : stateSpace → inputSpace

structure AbstractObservationSystem where
  stateSpace : Type u
  observationSpace : Type v
  dynamics : stateSpace → stateSpace
  observationMap : stateSpace → observationSpace

structure AdmissibleControlObservationPair (C : AbstractControlSystem) (O : AbstractObservationSystem) where
  compatibleStateSpace : C.stateSpace = O.stateSpace
  compatibleObservation : ∀ s : C.stateSpace, O.observationMap s = C.observationMap s
  controlledDynamics : ∀ s : C.stateSpace, O.dynamics s = C.dynamics s (C.controlLaw s)

end ControlObservationSystemsAbstractSpacesFoundation
end HautevilleHouse