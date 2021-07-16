let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:5276bf64bef224283450f97d93aa12b3da4ff1a61a06fd75849334718c83d387
  with on = On.match On.Event.ReleasesBranches "bats"
  with name = "bats (main)"
