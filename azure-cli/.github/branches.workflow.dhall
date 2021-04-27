let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:69a061ee89ff3c30ea9bbb245a67c130bd5531d612c23c81001b1af85120278a
  with on = On.match On.Event.FeatureBranches "azure-cli"
  with name = "azure-cli (branch)"
