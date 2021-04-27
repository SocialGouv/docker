let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:c2673af922ca33c69e88daa4c586213682f2772a4222f555b014b92af3eb4da5
  with on = On.match On.Event.FeatureBranches "bats"
  with name = "bats (branch)"
