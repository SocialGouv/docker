let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:8ae72e73fa1801f87b557ac270d9efd91d4da7a5806104536aa8c1d1a0adf5cc
  with on = On.match On.Event.ReleasesBranches "kubectl"
  with name = "kubectl (main)"
