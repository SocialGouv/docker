let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:a1cfab1c76a242228dd9af38d3ac289de23eb8691ab097cea423bbe0e94848de
  with on = On.match On.Event.FeatureBranches "bats"
  with name = "bats (branch)"
