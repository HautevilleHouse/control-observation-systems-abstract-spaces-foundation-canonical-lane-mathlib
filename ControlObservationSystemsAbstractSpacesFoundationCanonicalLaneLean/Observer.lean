import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean.ControlSystem

namespace HautevilleHouse
namespace ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean

structure Observer (Ω : Type u) (U : Type v) (Y : Type w) where
  outputSpace : ObservationSpace Y
  observationFunction : Ω → Y
  stateEstimate : Ω

structure ObserverPackage {Ω : Type u} {U : Type v} {Y : Type w} (Obs : Observer Ω U Y) where
  observationFunctionMeasurable : Prop
  detectabilityCondition : Prop
  observerConvergent : Prop

structure ObserverEvidence {Ω : Type u} {U : Type v} {Y : Type w} {Obs : Observer Ω U Y} (P : ObserverPackage Obs) where
  observationFunctionMeasurableClosed : P.observationFunctionMeasurable
  detectabilityConditionClosed : P.detectabilityCondition
  observerConvergentClosed : P.observerConvergent

def ObserverClosed {Ω : Type u} {U : Type v} {Y : Type w} {Obs : Observer Ω U Y} (P : ObserverPackage Obs) : Prop :=
  P.observationFunctionMeasurable ∧ P.detectabilityCondition ∧ P.observerConvergent

theorem observer_closed_from_evidence
    {Ω : Type u} {U : Type v} {Y : Type w} {Obs : Observer Ω U Y} (P : ObserverPackage Obs)
    (E : ObserverEvidence P) : ObserverClosed P := by
  exact And.intro E.observationFunctionMeasurableClosed
    (And.intro E.detectabilityConditionClosed E.observerConvergentClosed)

end ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean
end HautevilleHouse