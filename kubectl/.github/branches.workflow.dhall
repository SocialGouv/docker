let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:45ee1f06fb08d5771ec8c1878d43efa5b1ee4990b15cf8c22912ff4b5c6727f4
  with on = On.match On.Event.FeatureBranches "kubectl"
  with name = "kubectl (branch)"
