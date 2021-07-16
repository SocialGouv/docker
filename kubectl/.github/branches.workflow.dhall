let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:c1be848a467739d320234e021a27aab81c55da4f1397db52fbd914583bb3b448
  with on = On.match On.Event.FeatureBranches "kubectl"
  with name = "kubectl (branch)"
