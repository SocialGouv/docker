let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:5fecf64c5cd29d18634a1f0a071b6ce9ecfec3fe13bd7aeec6a5d3d4eda1f0ef
  with on = On.match On.Event.ReleasesBranches "git-deploy"
  with name = "git-deploy (main)"
