let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:24b99f91a28d77a58582a56e2da8224344a377a65a9ab8f7ba8942efa082901e
  with on = On.match On.Event.ReleasesBranches "no-k8s"
  with name = "no-k8s (main)"
