let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:00b05b2902f9e1629d07fec9bd7c06df2632cd27a572e50b9ddcf2091e20a02d
  with on = On.match On.Event.FeatureBranches "kosko"
  with name = "kosko (branch)"
