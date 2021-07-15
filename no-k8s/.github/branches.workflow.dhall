let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:b90069f903404fa9772fe065d329a0f260e736d692414e644ed304dcf7f6fd9e
  with on = On.match On.Event.FeatureBranches "no-k8s"
  with name = "no-k8s (branch)"
