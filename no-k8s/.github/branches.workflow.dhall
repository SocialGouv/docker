let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:c75c62b32f6febfa248bbe8644700fa44467b4bfd49695a597442233b3798121
  with on = On.match On.Event.FeatureBranches "no-k8s"
  with name = "no-k8s (branch)"
