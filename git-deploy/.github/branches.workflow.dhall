let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:051130e782398a2dd277b23b7fa2700c708d47046695939d1e7033faed818c99
  with on = On.match On.Event.FeatureBranches "git-deploy"
  with name = "git-deploy (branch)"
