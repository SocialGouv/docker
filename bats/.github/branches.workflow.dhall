let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:7932187319e621a4594615984a12b388b646b5c4a7e9b0dae22c5fea11c40d7e
  with on = On.match On.Event.FeatureBranches "bats"
  with name = "bats (branch)"
