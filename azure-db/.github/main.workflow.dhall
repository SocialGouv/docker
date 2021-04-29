let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:4207f342751c9cf4483985e0e8dee69917ba1db8ae820538d52451ee316c12c9
  with on = On.match On.Event.ReleasesBranches "azure-db"
  with name = "azure-db (main)"
