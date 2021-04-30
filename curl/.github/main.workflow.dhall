let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:093b87dc85007e99887dbd0950e67bae51bac9f2d5e1a3be39e4c78fd8ff1276
  with on = On.match On.Event.ReleasesBranches "curl"
  with name = "curl (main)"
