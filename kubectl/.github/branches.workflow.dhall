let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:8ca7106d67ece3f94ffef8c3f13acec370b245081095deeae2ca57d77300e8f9
  with on = On.match On.Event.FeatureBranches "kubectl"
  with name = "kubectl (branch)"
