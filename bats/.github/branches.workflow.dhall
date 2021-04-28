let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:6d69c86bd7bbf05b0a35993680cfd4c6469aafbbd53c038935bf2f6545af2aba
  with on = On.match On.Event.FeatureBranches "bats"
  with name = "bats (branch)"
