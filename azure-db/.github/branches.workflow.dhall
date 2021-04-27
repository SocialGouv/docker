let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:687a7f58abb1cf6204a2725328703bcf6e4123cf6473ec7dea2c82cb1b0a4fa0
  with on = On.match On.Event.FeatureBranches "azure-db"
  with name = "azure-db (branch)"
