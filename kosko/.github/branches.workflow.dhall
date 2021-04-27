let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:545340e0b1407d3ded275b127917d06d9118fb972cdafe913e83f3d4f7d2c843
  with on = On.match On.Event.FeatureBranches "kosko"
  with name = "kosko (branch)"
