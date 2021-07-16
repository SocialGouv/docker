let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:4fcb040be9d4c89ba352a6ffaa3ff4f8fb3e9d94ff76ff9f47bd1f8a5138ff94
  with on = On.match On.Event.ReleasesBranches "kubectl"
  with name = "kubectl (main)"
