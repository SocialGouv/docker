let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:70e19b7e9a7f797dffc20bb552464602eead001b5fb2bf07973361451f1d21e4
  with on = On.match On.Event.FeatureBranches "dhall"
  with name = "dhall (branch)"
