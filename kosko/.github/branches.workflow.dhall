let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:050f19e07ee869a808800d9a8ab56e99c15d70f01375e5f39290235d61f19a7c
  with on = On.match On.Event.FeatureBranches "kosko"
  with name = "kosko (branch)"
