let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:3dc937feb20028658e385c128c3fc4e58ceb74431df5c67dcba284b89f44b2a6
  with on = On.match On.Event.FeatureBranches "azure-db"
  with name = "azure-db (branch)"
