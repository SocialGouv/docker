let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:d9d57cc91918ae27cdc3e4c9213cb9793fde7dcc1f80e5c0aee96a93ba440609
  with on = On.match On.Event.ReleasesBranches "dhall"
  with name = "dhall (main)"
