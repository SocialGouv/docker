let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:e54749c7d5cede0ca45921be377b4b247a615bba0dba9fb45068d39c2a3c8c6b
  with on = On.match On.Event.ReleasesBranches "curl"
  with name = "curl (main)"
