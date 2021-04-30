let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:b21fbb101190da01e5f9c34d126d602058f1e2907e55e046d048c9988cc488a6
  with on = On.match On.Event.ReleasesBranches "bats"
  with name = "bats (main)"
