let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:37370c74aa0b3ca2b6efd8d2f1aefebf1b1dc23811e12ed02b1163e168889f57
  with on = On.match On.Event.FeatureBranches "kubectl"
  with name = "kubectl (branch)"
