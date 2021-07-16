let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:fe134b332a3ec74424886f9fdff81916d7537dd47e64a2cdfcd97f4ceb1268b7
  with on = On.match On.Event.ReleasesBranches "kosko"
  with name = "kosko (main)"
