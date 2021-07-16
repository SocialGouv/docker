let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:d3ffb3717107d8fec16fcdd62a9cd1c1486f791cf94b469615caf8f26419bb0f
  with on = On.match On.Event.FeatureBranches "curl"
  with name = "curl (branch)"
