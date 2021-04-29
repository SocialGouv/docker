let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:e98cf1cca7806947d36422bd9928b7d8d4a0bef33453f3864c2254c1e4de5b99
  with on = On.match On.Event.ReleasesBranches "dhall"
  with name = "dhall (main)"
