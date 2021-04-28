let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:3316e2ab8fe7bfdf7ed542b3f15f841a8311f908c8d025406dcfa7d4e8a81cf1
  with on = On.match On.Event.FeatureBranches "git-deploy"
  with name = "git-deploy (branch)"
