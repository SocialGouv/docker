let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:3c9414198be3ef41882e2df15559bae38f27020b8a3a0719cd9e199094407640
  with on = On.match On.Event.ReleasesBranches "azure-db"
  with name = "azure-db (main)"
