let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:a5b9d16620b72ee9de1ab3c418f0040723c8049bb79e34637c40c81b4a1842b5
  with on = On.match On.Event.FeatureBranches "bats"
  with name = "bats (branch)"
