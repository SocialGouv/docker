let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:d12c756f2feacf3066903136c1a1f2dfb7ccae971fe177773c0f208f9419df68
  with on = On.match On.Event.FeatureBranches "curl"
  with name = "curl (branch)"
