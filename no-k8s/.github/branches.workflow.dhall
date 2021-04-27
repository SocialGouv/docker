let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:7205638aa54c534b4153b6852bab72d0e2cf8185d0cb284edcab530f0474b893
  with on = On.match On.Event.FeatureBranches "no-k8s"
  with name = "no-k8s (branch)"
