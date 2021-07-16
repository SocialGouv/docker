let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:9b451014d1e44f37bb99f743d98e2007b60d8679bad70463b8046d93f8ff7603
  with on = On.match On.Event.FeatureBranches "no-k8s"
  with name = "no-k8s (branch)"
