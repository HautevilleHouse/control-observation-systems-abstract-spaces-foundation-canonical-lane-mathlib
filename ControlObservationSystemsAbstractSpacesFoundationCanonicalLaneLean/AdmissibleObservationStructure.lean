import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean

structure AdmissibleObservationStructure where
  observationSpace : Type u
  outputSpace : Type v
  observationTopology : TopologicalSpace observationSpace
  outputTopology : TopologicalSpace outputSpace
  outputMap : observationSpace → outputSpace
  continuousOutput : Prop
  injectiveOutput : Prop
  outputDeterminesState : Prop
  continuousOutputTerm : continuousOutput
  injectiveOutputTerm : injectiveOutput
  outputDeterminesStateTerm : outputDeterminesState

structure AdmissibleObservationEvidence (O : AdmissibleObservationStructure) where
  continuousOutputClosed : O.continuousOutput
  injectiveOutputClosed : O.injectiveOutput
  outputDeterminesStateClosed : O.outputDeterminesState

def AdmissibleObservationClosed (O : AdmissibleObservationStructure) : Prop :=
  O.continuousOutput ∧ O.injectiveOutput ∧ O.outputDeterminesState

theorem admissible_observation_closed_from_evidence (O : AdmissibleObservationStructure) (E : AdmissibleObservationEvidence O) : AdmissibleObservationClosed O := by
  exact And.intro E.continuousOutputClosed (And.intro E.injectiveOutputClosed E.outputDeterminesStateClosed)

end ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean
end HautevilleHouse