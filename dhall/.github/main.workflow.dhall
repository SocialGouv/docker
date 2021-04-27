let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:2fdd6cd9da449001307ce15b82417f83333be4cd4ee124d616cb2d8806786f80
  with on = On.match On.Event.ReleasesBranches "dhall"
  with name = "dhall (main)"
