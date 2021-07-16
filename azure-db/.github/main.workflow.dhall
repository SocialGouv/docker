let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:d5b234e81a62d8dfcada32c2697423950a4975195292421eb3d9376ef6ea1556
  with on = On.match On.Event.ReleasesBranches "azure-db"
  with name = "azure-db (main)"
