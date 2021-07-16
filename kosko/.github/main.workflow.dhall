let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:01356279413c99f12456597ff304890b399ae9c89ef020de2a168f6375d5a0d4
  with on = On.match On.Event.ReleasesBranches "kosko"
  with name = "kosko (main)"
