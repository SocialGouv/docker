let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:493711b735376283c0ecdfa43b7cea2a9dec43a97e779f6737f45885f836b286
  with on = On.match On.Event.ReleasesBranches "dhall"
  with name = "dhall (main)"
