let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:85254e78bf10b47d726d9758f7f69a36968f1f0a0ee0b580823947ce7e867280
  with on = On.match On.Event.ReleasesBranches "dhall"
  with name = "dhall (main)"
