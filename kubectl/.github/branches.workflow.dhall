let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:9d8694906427176c57a3eeac47b6b35bb97772b96f1530d1663286af0d968128
  with on = On.match On.Event.FeatureBranches "kubectl"
  with name = "kubectl (branch)"
