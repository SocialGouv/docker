let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:e82813dc6ce7528b5eafcc1df9d806d1ab184662d4a3b183a04cd62d15b3f883
  with on = On.match On.Event.FeatureBranches "dhall"
  with name = "dhall (branch)"
