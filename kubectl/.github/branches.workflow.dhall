let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:0e743c10f844fcea3e4f79eb4b8036f82fd996e5b332d9bdb2070b8bb7d8033f
  with on = On.match On.Event.FeatureBranches "kubectl"
  with name = "kubectl (branch)"
