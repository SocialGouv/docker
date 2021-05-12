let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:0b562479779a0b20d9e95929125cb3a79a8b293e1865996df96f8a60a347fa2d
  with on = On.match On.Event.ReleasesBranches "azure-db"
  with name = "azure-db (main)"
