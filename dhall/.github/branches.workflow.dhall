let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:c4881961a4f7a0138bd22be004eb90b97572a1ff3a596aa682042840a1c30ec7
  with on = On.match On.Event.FeatureBranches "dhall"
  with name = "dhall (branch)"
