let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:6091dd0d6cad9baebce30fa11a997e57a00f00afd523b509e55d655a1c167705
  with on = On.match On.Event.FeatureBranches "dhall"
  with name = "dhall (branch)"
