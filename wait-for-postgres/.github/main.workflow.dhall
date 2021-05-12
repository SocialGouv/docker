let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:9198eadbdea8e00c04d6a55b48053f5a79994531ce0b18f7fbadcb95b9ea4d05
  with on = On.match On.Event.ReleasesBranches "wait-for-postgres"
  with name = "wait-for-postgres (main)"
