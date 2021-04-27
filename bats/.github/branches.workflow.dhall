let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:bd3571e9717e1fdab6ecf904a19da511e28ee0d19632a643e960a2378fb70deb
  with on = On.match On.Event.FeatureBranches "bats"
  with name = "bats (branch)"
