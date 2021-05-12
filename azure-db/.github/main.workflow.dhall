let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:74c98273e82cee344559dde78ebb4d67a9691786eceec72a885c409a2a1728dc
  with on = On.match On.Event.ReleasesBranches "azure-db"
  with name = "azure-db (main)"
