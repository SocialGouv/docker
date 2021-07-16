let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:94cfa1785b484e57646622e3063d7f296ef803ba5912f02ab723c0eadba8db8a
  with on = On.match On.Event.FeatureBranches "kosko"
  with name = "kosko (branch)"
