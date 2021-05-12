let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:005d262b074b2669ac6d280d872a2e4d15b63ab6ce9646ad295728d01fac7bc8
  with on = On.match On.Event.FeatureBranches "no-k8s"
  with name = "no-k8s (branch)"
