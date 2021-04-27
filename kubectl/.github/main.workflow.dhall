let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:c9d6d97d9eb5048b362bc2b95cf0745180aa019cb81eb56749840b3beed3ef66
  with on = On.match On.Event.ReleasesBranches "kubectl"
  with name = "kubectl (main)"
