let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:825629e25018521225aac61c29045fc981220323b7552971c0931f1b583c89b9
  with on = On.match On.Event.ReleasesBranches "azure-db"
  with name = "azure-db (main)"
