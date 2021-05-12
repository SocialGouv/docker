let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:7e982d79d5d76a43aacbe551dc66f67c79176986fbf584dad16a43a03ad21eef
  with on = On.match On.Event.FeatureBranches "kosko"
  with name = "kosko (branch)"
