let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:f8fbf14fa30ae68547dbf9fbf5ebc72657e7acb17f500e7c65b5b069a2b10727
  with on = On.match On.Event.FeatureBranches "azure-cli"
  with name = "azure-cli (branch)"
