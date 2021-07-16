let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:bd4666ee3b4ff00b5afa52a83b6264ee10c94e66c2a349cb45e3d22c9f8095bf
  with on = On.match On.Event.ReleasesBranches "bats"
  with name = "bats (main)"
