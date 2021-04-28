let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:6c45e3e044bddfb4316d8c0f0bc8d9f7dc082608fe6529deff54853569852b0f
  with on = On.match On.Event.FeatureBranches "bats"
  with name = "bats (branch)"
