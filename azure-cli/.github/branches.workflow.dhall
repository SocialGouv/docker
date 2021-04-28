let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:55f9b697e05c6c28abb98c0dd78314a1f979d56c29d5b4ff32d9c44e495febad
  with on = On.match On.Event.FeatureBranches "azure-cli"
  with name = "azure-cli (branch)"
