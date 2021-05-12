let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:c1fb2f2cfd9d1e83c344f3c03baaa3c37716752205f9a88d15a269300cf33ea7
  with on = On.match On.Event.FeatureBranches "azure-cli"
  with name = "azure-cli (branch)"
