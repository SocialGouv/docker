let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:d019bc4f0960dfad8042370cd34f621fded3e4ba6e0102e0d097c73c7661895c
  with on = On.match On.Event.FeatureBranches "azure-db"
  with name = "azure-db (branch)"
