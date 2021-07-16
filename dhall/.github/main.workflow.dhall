let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:07056b093b9d11d145811bc3239f2330731f56b8020af96f2ad07effcff7cda5
  with on = On.match On.Event.ReleasesBranches "dhall"
  with name = "dhall (main)"
