let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:641c44d1405580ac8662f3f86fd55134d11bb3a28b4a90b21c54b0f2dfc18e3f
  with on = On.match On.Event.FeatureBranches "wait-for-postgres"
  with name = "wait-for-postgres (branch)"
