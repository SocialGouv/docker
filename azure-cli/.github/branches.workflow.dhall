let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:240ab8caeec2d643eee6fee50e3ef058f7d6fb9582da61bd7832d1618559554c
  with on = On.match On.Event.FeatureBranches "azure-cli"
  with name = "azure-cli (branch)"
