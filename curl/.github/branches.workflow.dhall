let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:5caf4ae3e3e24ae18039a1cef14b359d1bed4c756c41f0622e18c347c041b9c3
  with on = On.match On.Event.FeatureBranches "curl"
  with name = "curl (branch)"
