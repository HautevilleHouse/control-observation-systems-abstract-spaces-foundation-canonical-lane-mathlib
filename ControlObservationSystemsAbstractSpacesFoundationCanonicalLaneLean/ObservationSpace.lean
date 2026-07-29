import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean

structure ObservationSpace (Ω : Type u) where
  carrier : Set Ω
  sigmaAlgebra : MeasurableSpace carrier
  observationMaps : List (Ω → ℝ)

structure ObservationSpacePackage (Ω : Type u) (O : ObservationSpace Ω) where
  sigmaAlgebraGenerated : Prop
  observationMapsMeasurable : Prop
  separationProperty : Prop

structure ObservationSpaceEvidence {Ω : Type u} {O : ObservationSpace Ω} (P : ObservationSpacePackage Ω O) where
  sigmaAlgebraGeneratedClosed : P.sigmaAlgebraGenerated
  observationMapsMeasurableClosed : P.observationMapsMeasurable
  separationPropertyClosed : P.separationProperty

def ObservationSpaceClosed {Ω : Type u} {O : ObservationSpace Ω} (P : ObservationSpacePackage Ω O) : Prop :=
  P.sigmaAlgebraGenerated ∧ P.observationMapsMeasurable ∧ P.separationProperty

theorem observation_space_closed_from_evidence
    {Ω : Type u} {O : ObservationSpace Ω} (P : ObservationSpacePackage Ω O)
    (E : ObservationSpaceEvidence P) : ObservationSpaceClosed P := by
  exact And.intro E.sigmaAlgebraGeneratedClosed
    (And.intro E.observationMapsMeasurableClosed E.separationPropertyClosed)

end ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean
end HautevilleHouse