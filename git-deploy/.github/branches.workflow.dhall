let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:4edf9f893472ce97b0575d7197537ce4013d8fbe088ac0a1341d9b4dc9d320a6
  with on = On.match On.Event.FeatureBranches "git-deploy"
  with name = "git-deploy (branch)"
