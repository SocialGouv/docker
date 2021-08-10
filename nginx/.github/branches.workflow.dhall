let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:1e3917aad8833e63c7f4d5774806424cd5f662386890701eaf71c2b511d53acd
  with on = On.match On.Event.FeatureBranches "nginx"
  with name = "nginx (branch)"
