let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:546e2f182344e19b86cb53501a3efc4953eb2116f9a00c27c817340d821c92b2
  with on = On.match On.Event.FeatureBranches "ci-deploy"
  with name = "ci-deploy (branch)"
