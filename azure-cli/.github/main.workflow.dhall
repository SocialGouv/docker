let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:63ba8fb928ad5a3f209a332fbe27714cda65877bfde5a1a1771913dec6a0d2c0
  with on = On.match On.Event.ReleasesBranches "azure-cli"
  with name = "azure-cli (main)"
