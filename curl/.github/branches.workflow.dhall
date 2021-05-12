let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:30b05173540af94d3f8302831ed811beffaf45f7c6a31afe57e35578e701f2f3
  with on = On.match On.Event.FeatureBranches "curl"
  with name = "curl (branch)"
