let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:15778405379c4ed8c89a224c8136a6c497a4061e0347354a18b67731189105e4
  with on = On.match On.Event.FeatureBranches "kubectl"
  with name = "kubectl (branch)"
