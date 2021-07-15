let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:a29805c94eb62d313f1f5192d504e84943e9357114cbe7eac460c3e00d791bf7
  with on = On.match On.Event.ReleasesBranches "nginx4spa"
  with name = "nginx4spa (main)"
