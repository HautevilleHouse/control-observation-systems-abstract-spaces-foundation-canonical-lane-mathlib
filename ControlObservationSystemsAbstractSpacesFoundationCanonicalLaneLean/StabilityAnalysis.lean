import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean.SystemDynamics

namespace HautevilleHouse
namespace ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean

structure LyapunovFunction (S : AbstractStateSpace) where
  function : S.carrier → ℝ
  positiveDefinite : ∀ x ≠ 0, function x > 0
  continuous : Continuous function

structure StabilityPackage (S : AbstractStateSpace) (C : AbstractControlSpace)
  (D : SystemDynamicsPackage S C) where
  lyapunovFunction : LyapunovFunction S
  lyapunovDecrease : ∀ (x : S.carrier) (u : C.carrier),
    lyapunovFunction.function (D.discreteTime.transition (x, u)) ≤ lyapunovFunction.function x
  asymptoticStability : ∀ (x : S.carrier) (u : C.carrier),
    Filter.Tendsto (λ n : ℕ => lyapunovFunction.function (D.discreteTime.transition (x, u))) 
      Filter.atTop (𝓝 0)

structure StabilityEvidence (S : AbstractStateSpace) (C : AbstractControlSpace)
  (D : SystemDynamicsPackage S C) (P : StabilityPackage S C D) where
  lyapunovDecreaseClosed : P.lyapunovDecrease
  asymptoticStabilityClosed : P.asymptoticStability

def StabilityClosed (S : AbstractStateSpace) (C : AbstractControlSpace)
  (D : SystemDynamicsPackage S C) (P : StabilityPackage S C D) : Prop :=
  P.lyapunovDecrease ∧ P.asymptoticStability

theorem stability_closed_from_evidence (S : AbstractStateSpace) (C : AbstractControlSpace)
  (D : SystemDynamicsPackage S C) (P : StabilityPackage S C D) (E : StabilityEvidence S C D P) :
  StabilityClosed S C D P :=
  And.intro E.lyapunovDecreaseClosed E.asymptoticStabilityClosed

end ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean
end HautevilleHouse
