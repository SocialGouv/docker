let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:48cf8fa880de03e6490c9c8bf929a273f5b058cb88ba56d013b22a4c67654e4d
  with on = On.match On.Event.ReleasesBranches "bats"
  with name = "bats (main)"
