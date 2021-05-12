let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:7a1a8d532b1f28cd4da0ed7d5c26c3a57ac2d0a8ccf1b75a46be50eef7bc30a8
  with on = On.match On.Event.FeatureBranches "git-deploy"
  with name = "git-deploy (branch)"
