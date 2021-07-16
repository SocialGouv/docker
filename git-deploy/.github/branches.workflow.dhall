let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:950eb102a7dc8a0ac39b4aaa0ccbaa6932b790805ee95b1436d3d69d8983a8f8
  with on = On.match On.Event.FeatureBranches "git-deploy"
  with name = "git-deploy (branch)"
