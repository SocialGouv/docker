let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:e4ae748dd4b054b176bf8ec7bbdb75bdfcd31bb4b55c14eea0af00e13ba76db2
  with on = On.match On.Event.FeatureBranches "wait-for-http"
  with name = "wait-for-http (branch)"
