let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:83662a8fad3c5764fdcff2b5c4ed9ca80523eb1647c14888a976df2e2d31cbaf
  with on = On.match On.Event.FeatureBranches "bats"
  with name = "bats (branch)"
