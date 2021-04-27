let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:fa5bf8c215799c4a37f17d5ef1e4d45f8cb6ec63adea69a65015e64d4783f6f4
  with on = On.match On.Event.FeatureBranches "kosko"
  with name = "kosko (branch)"
