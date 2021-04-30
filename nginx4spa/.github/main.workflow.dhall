let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:9da9c38b893d7aaf088aefdf07ae03b8f783ea0b77842b9bfc5664caed75471c
  with on = On.match On.Event.ReleasesBranches "nginx4spa"
  with name = "nginx4spa (main)"
