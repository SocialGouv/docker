let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:3c9e9e92fea0b13e6330f83cd21b34546d4fe33c23034fe9333076d5e425e475
  with on = On.match On.Event.FeatureBranches "azure-db"
  with name = "azure-db (branch)"
