let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:c3135ac052bee9cc2a2c01d331e5501f0da87ecb228e9434375bc3a4eea05d82
  with on = On.match On.Event.ReleasesBranches "dhall"
  with name = "dhall (main)"
