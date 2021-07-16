let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:807f3464967d85ca67d69b46fe35476f9b96383e9aae44d7e6f50a09a8765a13
  with on = On.match On.Event.FeatureBranches "kosko"
  with name = "kosko (branch)"
