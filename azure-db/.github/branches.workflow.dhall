let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:e5a775e691f922074f9c61c1ac683e4dda8b8f05ae065d2e38e97ed0ad71d7b1
  with on = On.match On.Event.FeatureBranches "azure-db"
  with name = "azure-db (branch)"
