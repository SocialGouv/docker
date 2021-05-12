let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:347a461369ffe4640bef177a42167b301635a5de0711b86d3c8e857b66848930
  with on = On.match On.Event.FeatureBranches "nginx4spa"
  with name = "nginx4spa (branch)"
