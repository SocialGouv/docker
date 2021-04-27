let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:fd5eae7d425dd4fd09f5ba7daa75903791f92805ffde4ebb2503202c2d5e6ca9
  with on = On.match On.Event.ReleasesBranches "dhall"
  with name = "dhall (main)"
