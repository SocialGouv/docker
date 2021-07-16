let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:2c28df917c2cbd7bc9af6502e5345ea91097711df52b8b7c30cf0fccbdefaf11
  with on = On.match On.Event.ReleasesBranches "azure-cli"
  with name = "azure-cli (main)"
