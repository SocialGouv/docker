let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:144f2e5f68e1bd05cc4270233aa8d6cdf427dea52ef4023dd4dfa1e4c0e315d7
  with on = On.match On.Event.FeatureBranches "wait-for-http"
  with name = "wait-for-http (branch)"
