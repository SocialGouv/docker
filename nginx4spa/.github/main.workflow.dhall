let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:ca2ceb2297647578a9abd5ed1f873734c2a897e53fdbefd048c7a42d23c8cd87
  with on = On.match On.Event.ReleasesBranches "nginx4spa"
  with name = "nginx4spa (main)"
