let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:3e7fd600587d924d487ac8df7bd633bf60721ca3e4560431c35a8a1ae06c2b50
  with on = On.match On.Event.ReleasesBranches "azure-db"
  with name = "azure-db (main)"
