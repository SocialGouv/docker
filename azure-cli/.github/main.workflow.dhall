let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:eabf8dfc114bef6f22a577e5049bdc9a21c9839d8f9aab75f38a707a7cc87fc7
  with on = On.match On.Event.ReleasesBranches "azure-cli"
  with name = "azure-cli (main)"
