let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:3f296e09ecb1f90827470c6b7c8c187ca588b2341fb93f1fcdf3782e285d8d58
  with on = On.match On.Event.FeatureBranches "bats"
  with name = "bats (branch)"
