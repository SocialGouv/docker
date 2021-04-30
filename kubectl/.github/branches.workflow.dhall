let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:74abde38c395a8ae9df96e25a172731d88a7d2df2ae22beadcc3d8dce150ad45
  with on = On.match On.Event.FeatureBranches "kubectl"
  with name = "kubectl (branch)"
