let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:cc696fb69cc68d4ab8f6198d7ba62fa3de55e1f6c351ed51c8beba197ee86046
  with on = On.match On.Event.FeatureBranches "no-k8s"
  with name = "no-k8s (branch)"
