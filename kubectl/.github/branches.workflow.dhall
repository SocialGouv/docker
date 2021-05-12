let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:c86aae85226c038a68e25707030fff0a3e50fd827c6edfde90d085dc543ecc08
  with on = On.match On.Event.FeatureBranches "kubectl"
  with name = "kubectl (branch)"
