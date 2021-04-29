let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:32d599c2b10ecca54f3118c30f309f465f3e68cbb2840d33cfd662ea1e26cc7e
  with on = On.match On.Event.ReleasesBranches "kosko"
  with name = "kosko (main)"
