let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:bac3567ff31f523983193650eb4ec7b8e8eb4eaac6c51be1c194b42ae249e589
  with on = On.match On.Event.FeatureBranches "kosko"
  with name = "kosko (branch)"
