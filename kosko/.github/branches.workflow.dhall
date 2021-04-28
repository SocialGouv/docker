let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:b97d43e9ecaf9fc267fb24a904e8726ef3212a89407ff528275d089f31637164
  with on = On.match On.Event.FeatureBranches "kosko"
  with name = "kosko (branch)"
