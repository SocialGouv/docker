let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:2d991f765214d993c623fab6d8e85f670bcad607c4459b800a7cae89a37495ca
  with on = On.match On.Event.FeatureBranches "git-deploy"
  with name = "git-deploy (branch)"
