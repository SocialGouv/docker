let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:072a0efa5bf1208853dd188f540792f1f831de7f8f8d973d8eff2d6f61718264
  with on = On.match On.Event.FeatureBranches "azure-cli"
  with name = "azure-cli (branch)"
