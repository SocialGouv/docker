let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:480a755e8f441068c7416e33f323f89876100e29ee2526e162b376ab66452f99
  with on = On.match On.Event.FeatureBranches "curl"
  with name = "curl (branch)"
