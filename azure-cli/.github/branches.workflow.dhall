let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:83fa23cf8afa909133fc21eb72592f054b27458f4041b8c24adf90e0ce22128e
  with on = On.match On.Event.FeatureBranches "azure-cli"
  with name = "azure-cli (branch)"
