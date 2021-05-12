let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:e796f4eca7c0e0b173bcc9d0211556e08da17762e3d3a57b4313a02f26c1a643
  with on = On.match On.Event.FeatureBranches "kosko"
  with name = "kosko (branch)"
