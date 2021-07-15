let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:519b96c2f9d6e74d71ecbcfba1494b9813ae7a3354d5d567bb13e8ecec855933
  with on = On.match On.Event.FeatureBranches "wait-for-postgres"
  with name = "wait-for-postgres (branch)"
