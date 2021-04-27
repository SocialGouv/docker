let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:fa7435138733776c8713c4deb8e3e3e96d2ec58ba1c6a874842ab5c932d97966
  with on = On.match On.Event.ReleasesBranches "azure-db"
  with name = "azure-db (main)"
