let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:585d9f475f355b2031542905a35347bb46f8678aa4cffd7929e8a7c2f4d0c446
  with on = On.match On.Event.ReleasesBranches "azure-db"
  with name = "azure-db (main)"
