let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:b0fb90107b39d378f79709b26b49554c665f6ccd47012e9a30d5c565db165eb4
  with on = On.match On.Event.ReleasesBranches "azure-db"
  with name = "azure-db (main)"
