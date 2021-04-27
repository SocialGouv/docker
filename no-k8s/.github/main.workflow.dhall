let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:44c5a404edc0731362b3fc50326ce677af785372c3f16ff83f9caa9858c76126
  with on = On.match On.Event.ReleasesBranches "no-k8s"
  with name = "no-k8s (main)"
