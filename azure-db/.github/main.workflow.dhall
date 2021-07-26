let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:fe76221257e1d1cd3b9759ca5a3d44f95977efc0ccf6c3c83c428004e6ce2fe6
  with on = On.match On.Event.ReleasesBranches "azure-db"
  with name = "azure-db (main)"
