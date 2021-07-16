let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:0570498085cd3b909463b618e910ff8abe8585829e104e991be38c9a7b42cd2b
  with on = On.match On.Event.ReleasesBranches "azure-db"
  with name = "azure-db (main)"
