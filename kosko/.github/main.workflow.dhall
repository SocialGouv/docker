let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:3d9aea24361eabe41df7b29db93114db225d3d2d669800b5345a0ce7d4dce841
  with on = On.match On.Event.ReleasesBranches "kosko"
  with name = "kosko (main)"
