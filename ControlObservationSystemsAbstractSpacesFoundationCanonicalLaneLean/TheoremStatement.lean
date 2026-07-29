import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  manifoldConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String
deriving Repr, DecidableEq

def sourceTheoremStatement : TheoremStatement :=
  { sourceKey := "control-observation-systems-abstract-spaces-foundation",
    theoremName := "ControlObservationSystemsAbstractSpacesFoundation",
    theoremObject := "A bridge/gate closure for control observation systems in abstract spaces",
    classicalBoundary := "The unrestricted classical boundary remains carried.",
    manifoldConstrainedStatement := "Abstract space constrained theorem certificate.",
    certificateLane := "manifold_constrained",
    carriedRemainder := "classical source boundary carried"
  }

end ControlObservationSystemsAbstractSpacesFoundationCanonicalLaneLean
end HautevilleHouse