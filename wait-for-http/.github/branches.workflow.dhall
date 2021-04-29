let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:c8c4603d20a59eb8b8e6fe41e8813320ae043a3db157343662850d273fcc2c92
  with on = On.match On.Event.FeatureBranches "wait-for-http"
  with name = "wait-for-http (branch)"
