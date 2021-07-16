let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:c07d0d11fd87207422175f8eb2667ce31a63a1a977864806c33ecaf4abd3a2fc
  with on = On.match On.Event.ReleasesBranches "kubectl"
  with name = "kubectl (main)"
