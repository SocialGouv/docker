let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:ee9efa1f3ef630954db7e551f64c018f09c20f79b39d6d503b46558fe188912b
  with on = On.match On.Event.ReleasesBranches "kubectl"
  with name = "kubectl (main)"
