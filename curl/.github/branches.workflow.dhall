let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:e688505aac0452e1e68cbeabaa2adf0f47b1d999ff71e93eeff2d3bb7e597d58
  with on = On.match On.Event.FeatureBranches "curl"
  with name = "curl (branch)"
