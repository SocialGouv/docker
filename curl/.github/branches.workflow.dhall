let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:0e71f9d4bee70f9d198040ab0ac1a7146d4062e9f5a68a39f8f642a4c8dfb979
  with on = On.match On.Event.FeatureBranches "curl"
  with name = "curl (branch)"
