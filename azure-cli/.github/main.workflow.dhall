let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:39fadca04dbd693007b9666875997cc1e0cd7c4b5e0ce098dfdcc995b4d44e5d
  with on = On.match On.Event.ReleasesBranches "azure-cli"
  with name = "azure-cli (main)"
