let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:d4ecc3ac7671857ed40b3e57c363734c7891906d9895cd317757a896ac300f83
  with on = On.match On.Event.FeatureBranches "no-k8s"
  with name = "no-k8s (branch)"
