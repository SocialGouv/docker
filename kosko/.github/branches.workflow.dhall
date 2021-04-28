let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:445c49ae0520e879ad41be7a76d729d4663857d0d6aa51f961bca9e28bccf1fc
  with on = On.match On.Event.FeatureBranches "kosko"
  with name = "kosko (branch)"
