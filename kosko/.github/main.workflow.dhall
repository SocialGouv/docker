let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:e3bca76e56ac864e2823388be12ce30f3d84a1147ca545d83d53d190f934d01a
  with on = On.match On.Event.ReleasesBranches "kosko"
  with name = "kosko (main)"
