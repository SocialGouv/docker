let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:22730a113c9fb45c89c5237004f8056c4f51a64a0efcaebb85e465336fb12d1f
  with on = On.match On.Event.ReleasesBranches "kubectl"
  with name = "kubectl (main)"
