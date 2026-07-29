import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean.AbstractStateSpace

namespace HautevilleHouse
namespace ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean

structure ObservationModel (S : AbstractStateSpace) (O : AbstractObservationSpace) where
  observationFunction : S.carrier → O.carrier
  observationMeasurable : Measurable observationFunction
  noiseStructure : Prop
  observationHistory : ℕ → S.carrier → List O.carrier

structure ObservationEvidence (S : AbstractStateSpace) (O : AbstractObservationSpace) 
  (M : ObservationModel S O) where
  observationFunctionClosed : M.observationMeasurable
  noiseStructureClosed : M.noiseStructure
  observationHistoryConsistent : ∀ (n : ℕ) (x : S.carrier),
    M.observationHistory n x = List.map M.observationFunction (List.replicate n x)

def ObservationModelClosed (S : AbstractStateSpace) (O : AbstractObservationSpace)
  (M : ObservationModel S O) : Prop :=
  M.observationMeasurable ∧ M.noiseStructure

theorem observation_model_closed_from_evidence (S : AbstractStateSpace) (O : AbstractObservationSpace)
  (M : ObservationModel S O) (E : ObservationEvidence S O M) : ObservationModelClosed S O M :=
  And.intro E.observationFunctionClosed E.noiseStructureClosed

end ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean
end HautevilleHouse
