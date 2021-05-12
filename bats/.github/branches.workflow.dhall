let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:04ac5c955eddd17acf41c4801f2d6c5c502cbef4b0ceef8380e903f2fecf8566
  with on = On.match On.Event.FeatureBranches "bats"
  with name = "bats (branch)"
