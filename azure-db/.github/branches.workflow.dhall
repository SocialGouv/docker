let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:fc5d04744fca117beaa3d3d1c0b5a73b61fffef3c428c293549f88d3c4fb525c
  with on = On.match On.Event.FeatureBranches "azure-db"
  with name = "azure-db (branch)"
