let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:0476e9e88e8c46cf404d95d757c67121565cb9b08a02374858d90c1d05043931
  with on = On.match On.Event.ReleasesBranches "curl"
  with name = "curl (main)"
