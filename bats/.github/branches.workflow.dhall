let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:0535f5c33adeeb9e73d2257af2a0e7cc2d665b67560c7ba51260d97849514d13
  with on = On.match On.Event.FeatureBranches "bats"
  with name = "bats (branch)"
