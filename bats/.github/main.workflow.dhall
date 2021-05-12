let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:a6bd0c49fa66fbe0e096dfe4baa15a66b284b21a658f45406ca267612db2ca17
  with on = On.match On.Event.ReleasesBranches "bats"
  with name = "bats (main)"
