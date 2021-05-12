let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:b6d71ff23eb4381cc0883e197b7acae4cfb10d0440bbe44357ad8891c7175cd0
  with on = On.match On.Event.FeatureBranches "dhall"
  with name = "dhall (branch)"
