let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:4c24f09a5cadd9d73bff8590cf7097dec4289638edd7562f9c50febb03fb2d1b
  with on = On.match On.Event.FeatureBranches "dhall"
  with name = "dhall (branch)"
