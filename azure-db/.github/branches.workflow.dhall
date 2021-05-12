let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:4d1108f78941648518480c8474f1eb43416e39809f4c7efd95e49cd6b434af75
  with on = On.match On.Event.FeatureBranches "azure-db"
  with name = "azure-db (branch)"
