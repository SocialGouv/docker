let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:812929ef8581b5b56f30d943ef2e121e92edf024e80a36975fa8a4e0f2b34b5b
  with on = On.match On.Event.ReleasesBranches "bats"
  with name = "bats (main)"
