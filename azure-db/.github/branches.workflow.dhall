let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:5f3e46602698b7d7bb5d788893406ba988f977f10e00bccda3cb259d7179fa6c
  with on = On.match On.Event.FeatureBranches "azure-db"
  with name = "azure-db (branch)"