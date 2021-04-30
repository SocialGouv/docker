let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:bdeda8ff2d70a6ce260ccee8f82dce81f49e265cc244d3e0bee28bc47337c561
  with on = On.match On.Event.FeatureBranches "wait-for-postgres"
  with name = "wait-for-postgres (branch)"
