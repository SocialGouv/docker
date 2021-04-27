let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:56697c9f9a47c511f5160b48f02e0a99531aea4263647e02e7b1415100eb08d3
  with on = On.match On.Event.ReleasesBranches "azure-cli"
  with name = "azure-cli (main)"
