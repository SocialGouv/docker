let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:91284223497f8540d8aacb263826ddbdc54fa61a0672cdd91f58df3d76e1a975
  with on = On.match On.Event.ReleasesBranches "wait-for-postgres"
  with name = "wait-for-postgres (main)"
