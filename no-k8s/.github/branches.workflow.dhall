let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:5e86d0fa31504279d501014d7afa2f0232be3387674b84a755c3260cc8e32e78
  with on = On.match On.Event.FeatureBranches "no-k8s"
  with name = "no-k8s (branch)"
