let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:967f71e51e3f23ae85c59eaa078a62a32aac37dab80ac70b72f494787cef4033
  with on = On.match On.Event.FeatureBranches "wait-for-http"
  with name = "wait-for-http (branch)"
