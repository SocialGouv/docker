let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:f09e55f1e2e767d0d71c5845adbc7d1e89c0b754441b1a239539ccf8aed1d49f
  with on = On.match On.Event.FeatureBranches "nginx4spa"
  with name = "nginx4spa (branch)"
