let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:88481f11ec1b60a8bbecd6535476e2190c8e18deadd1178074a50ab54a0d4c9f
  with on = On.match On.Event.FeatureBranches "kubectl"
  with name = "kubectl (branch)"
