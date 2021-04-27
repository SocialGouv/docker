let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:8c86373a5649a5a46c7ed778f8dfe1a221846ab1fa834e3e7e28f1c411c749be
  with on = On.match On.Event.ReleasesBranches "curl"
  with name = "curl (main)"
