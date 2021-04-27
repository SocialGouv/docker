let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:9a3ec8c52fb3d0a0521b3f31944ba14f2f2fba903c509caf68575782fea81a50
  with on = On.match On.Event.FeatureBranches "azure-cli"
  with name = "azure-cli (branch)"
