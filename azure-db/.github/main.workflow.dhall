let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:24f7e83bd29ac8696107ee45ff108d35afcb93c73c0cc80751f8d22621544021
  with on = On.match On.Event.ReleasesBranches "azure-db"
  with name = "azure-db (main)"
