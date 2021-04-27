let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:011af2d2e06deee9ae0cfd114658f4c6e2c98356f62f122e9c29a670c003888f
  with on = On.match On.Event.ReleasesBranches "no-k8s"
  with name = "no-k8s (main)"
