let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:a044db91dbf0a378351ead572c41a7dbac35f540714cbdcd4df7b4499ce7b01c
  with on = On.match On.Event.FeatureBranches "nginx4spa"
  with name = "nginx4spa (branch)"
