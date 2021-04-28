let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:84e9133e78a718cc0645fc38fdb35592d86b40d4ac63d440fab6f872a49ff90f
  with on = On.match On.Event.FeatureBranches "kosko"
  with name = "kosko (branch)"
