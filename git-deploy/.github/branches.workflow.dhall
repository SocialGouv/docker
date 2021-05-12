let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:06a7890d531b7d809c77377fe07bbda499077ee0db6fc75215351367465a3166
  with on = On.match On.Event.FeatureBranches "git-deploy"
  with name = "git-deploy (branch)"
