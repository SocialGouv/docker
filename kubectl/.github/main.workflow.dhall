let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:8f7877c8ca3caa2e90e7feabf15c2b765b8139ee87a9b8445c5b77e97712babb
  with on = On.match On.Event.ReleasesBranches "kubectl"
  with name = "kubectl (main)"
