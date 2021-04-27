let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:9927ab5f8bfee241b98c0f3e2b48df47688d1b191074bda9d88b7ce7f455290c
  with on = On.match On.Event.FeatureBranches "kubectl"
  with name = "kubectl (branch)"
