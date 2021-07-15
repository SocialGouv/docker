let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:56a35c9bed7e999ec6aff2066f67cadfe0b5992890a0576365b9fd65fbd0602c
  with on = On.match On.Event.FeatureBranches "kosko"
  with name = "kosko (branch)"
