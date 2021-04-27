let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:1d0ede2b55fc747bb6a6b921ed4865ce783125ae44fd1e4ce21b421a1875e8c3
  with on = On.match On.Event.ReleasesBranches "kosko"
  with name = "kosko (main)"
