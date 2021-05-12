let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:e25104f9e1f6f68fd1f3f94db49c3a2fe92b788456f5c06b6638dd09a81d2c71
  with on = On.match On.Event.ReleasesBranches "dhall"
  with name = "dhall (main)"
