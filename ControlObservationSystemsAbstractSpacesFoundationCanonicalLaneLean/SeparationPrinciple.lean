import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean

structure SeparationPrinciplePackage {S : StateSpacePackage}
    {O : ObserverPackage S} {C : ControllerPackage S} where
  combinedDynamicsStable : Prop
  separationHolds : Prop
  performancePreserved : Prop

structure SeparationPrincipleEvidence {S : StateSpacePackage}
    {O : ObserverPackage S} {C : ControllerPackage S}
    (P : SeparationPrinciplePackage O C) where
  combinedDynamicsStableClosed : P.combinedDynamicsStable
  separationHoldsClosed : P.separationHolds
  performancePreservedClosed : P.performancePreserved

def SeparationPrincipleClosed {S : StateSpacePackage}
    {O : ObserverPackage S} {C : ControllerPackage S}
    (P : SeparationPrinciplePackage O C) : Prop :=
  P.combinedDynamicsStable ∧ P.separationHolds ∧ P.performancePreserved

theorem separation_principle_closed_from_evidence {S : StateSpacePackage}
    {O : ObserverPackage S} {C : ControllerPackage S}
    (P : SeparationPrinciplePackage O C) (E : SeparationPrincipleEvidence P) :
    SeparationPrincipleClosed P := by
  exact And.intro E.combinedDynamicsStableClosed
    (And.intro E.separationHoldsClosed E.performancePreservedClosed)

end ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean
end HautevilleHouse