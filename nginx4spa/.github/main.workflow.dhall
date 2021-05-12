let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:8f5b3932be3c1d117a3fa6983f68cab154134e1b831d3c6070beaeaceef50269
  with on = On.match On.Event.ReleasesBranches "nginx4spa"
  with name = "nginx4spa (main)"
