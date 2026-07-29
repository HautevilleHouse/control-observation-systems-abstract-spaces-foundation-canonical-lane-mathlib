import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean

structure AbstractSpace (X : Type u) where
  topology : TopologicalSpace X
  metric : MetricSpace X
  completeness : Prop
  separability : Prop

structure AbstractSpacePackage (X : Type u) (A : AbstractSpace X) where
  topologyConsistent : Prop
  metricConsistent : Prop
  completenessClosed : A.completeness
  separabilityClosed : A.separability

structure AbstractSpaceEvidence {X : Type u} {A : AbstractSpace X} (P : AbstractSpacePackage X A) where
  topologyConsistentClosed : P.topologyConsistent
  metricConsistentClosed : P.metricConsistent
  completenessClosed : P.completenessClosed
  separabilityClosed : P.separabilityClosed

def AbstractSpaceClosed {X : Type u} {A : AbstractSpace X} (P : AbstractSpacePackage X A) : Prop :=
  P.topologyConsistent ∧ P.metricConsistent ∧ P.completenessClosed ∧ P.separabilityClosed

theorem abstract_space_closed_from_evidence
    {X : Type u} {A : AbstractSpace X} (P : AbstractSpacePackage X A)
    (E : AbstractSpaceEvidence P) : AbstractSpaceClosed P := by
  exact And.intro E.topologyConsistentClosed
    (And.intro E.metricConsistentClosed
      (And.intro E.completenessClosed E.separabilityClosed))

end ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean
end HautevilleHouse