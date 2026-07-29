import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean

structure AbstractStateSpace where
  carrier : Type u
  topology : TopologicalSpace carrier
  measurableStructure : MeasurableSpace carrier
  sigmaAlgebra : SigmaAlgebra carrier

structure AbstractObservationSpace where
  carrier : Type u
  topology : TopologicalSpace carrier
  measurableStructure : MeasurableSpace carrier
  outputType : Type v

structure AbstractControlSpace where
  carrier : Type u
  topology : TopologicalSpace carrier
  measurableStructure : MeasurableSpace carrier
  controlInputType : Type v

end ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean
end HautevilleHouse
