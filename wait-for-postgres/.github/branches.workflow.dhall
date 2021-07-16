let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:ef3c633965a74f417ff37dd98cd4a7754a1f227424ec1245330425e2315055f8
  with on = On.match On.Event.FeatureBranches "wait-for-postgres"
  with name = "wait-for-postgres (branch)"
