let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:9ba5aa369d084a1b682a43283f879384c769f9d96c31467da87afbdb3ecf3f61
  with on = On.match On.Event.ReleasesBranches "bats"
  with name = "bats (main)"
