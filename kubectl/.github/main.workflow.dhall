let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:b2916ebaa565a95beb529fdfc81cba49e66c12666707a3ceff44f6d551edb357
  with on = On.match On.Event.ReleasesBranches "kubectl"
  with name = "kubectl (main)"
