let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:405c1f25a27400266b0f33794f478ef5f7b7274ad93b23d839bae1e996709fd5
  with on = On.match On.Event.FeatureBranches "git-deploy"
  with name = "git-deploy (branch)"
