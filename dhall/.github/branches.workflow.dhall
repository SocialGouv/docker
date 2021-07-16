let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:ec2a70721b1d13e3224e691063450ee4feaa3b11a56093697cc898786407d09c
  with on = On.match On.Event.FeatureBranches "dhall"
  with name = "dhall (branch)"
