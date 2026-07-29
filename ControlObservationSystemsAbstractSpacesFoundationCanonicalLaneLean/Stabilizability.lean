import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean.ControlSystem

namespace HautevilleHouse
namespace ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean

structure Stabilizability (Ω : Type u) (U : Type v) where
  system : ControlSystem Ω U
  feedback : Ω → U
  equilibrium : Ω
  stabilityCondition : Prop

structure StabilizabilityPackage {Ω : Type u} {U : Type v} (S : Stabilizability Ω U) where
  feedbackMeasurable : Prop
  equilibriumStable : Prop
  stabilityConditionClosed : S.stabilityCondition

structure StabilizabilityEvidence {Ω : Type u} {U : Type v} {S : Stabilizability Ω U} (P : StabilizabilityPackage S) where
  feedbackMeasurableClosed : P.feedbackMeasurable
  equilibriumStableClosed : P.equilibriumStable
  stabilityConditionClosed : P.stabilityConditionClosed

def StabilizabilityClosed {Ω : Type u} {U : Type v} {S : Stabilizability Ω U} (P : StabilizabilityPackage S) : Prop :=
  P.feedbackMeasurable ∧ P.equilibriumStable ∧ P.stabilityConditionClosed

theorem stabilizability_closed_from_evidence
    {Ω : Type u} {U : Type v} {S : Stabilizability Ω U} (P : StabilizabilityPackage S)
    (E : StabilizabilityEvidence P) : StabilizabilityClosed P := by
  exact And.intro E.feedbackMeasurableClosed
    (And.intro E.equilibriumStableClosed E.stabilityConditionClosed)

end ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean
end HautevilleHouse