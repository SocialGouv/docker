let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:77327283d7c334b5150ca15866987a5d226c0ff9e0fa6bbf39e435f6f9a4f261
  with on = On.match On.Event.ReleasesBranches "azure-db"
  with name = "azure-db (main)"
