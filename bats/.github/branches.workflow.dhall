let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:4101b345960f1a4440203d8fb45fc4dd6ece07415a4033496f1182d442abf1e5
  with on = On.match On.Event.FeatureBranches "bats"
  with name = "bats (branch)"
