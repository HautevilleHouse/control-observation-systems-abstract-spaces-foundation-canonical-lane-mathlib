import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean.AbstractStateSpace

namespace HautevilleHouse
namespace ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean

structure DiscreteTimeDynamics (S : AbstractStateSpace) (C : AbstractControlSpace) where
  transition : S.carrier × C.carrier → S.carrier
  transitionMeasurable : Measurable transition

structure ContinuousTimeDynamics (S : AbstractStateSpace) (C : AbstractControlSpace) where
  flow : ℝ × S.carrier × C.carrier → S.carrier
  flowContinuous : Continuous flow
  flowSemigroup : ∀ (t1 t2 : ℝ) (x : S.carrier) (u : C.carrier),
    flow (t1 + t2, x, u) = flow (t1, flow (t2, x, u), u)

structure SystemDynamicsPackage (S : AbstractStateSpace) (C : AbstractControlSpace) where
  discreteTime : DiscreteTimeDynamics S C
  continuousTime : ContinuousTimeDynamics S C
  consistency : ∀ (x : S.carrier) (u : C.carrier), 
    discreteTime.transition (x, u) = continuousTime.flow (1, x, u)

end ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean
end HautevilleHouse
