let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:f39186aa945d0bbb8f57e797c4fda3bdbd3b71cda67d7fa13ee8222a22fd1d90
  with on = On.match On.Event.ReleasesBranches "no-k8s"
  with name = "no-k8s (main)"
