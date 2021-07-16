let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:410aa55d1adbb5f7a2157ec38c6534c2bf8fbe59f3e7d1051b8e7b3c43a217f1
  with on = On.match On.Event.FeatureBranches "bats"
  with name = "bats (branch)"
