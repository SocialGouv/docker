let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:78d732778b7c061afabbf12c38d63a0c02b539f2a559a1d4853235819f630d1d
  with on = On.match On.Event.FeatureBranches "azure-cli"
  with name = "azure-cli (branch)"
