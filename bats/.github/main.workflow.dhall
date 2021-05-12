let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:7b6a778bee8db9eb9f997f1c71cec2b1032cbbc1feb9b305aecec051e7231dbe
  with on = On.match On.Event.ReleasesBranches "bats"
  with name = "bats (main)"
