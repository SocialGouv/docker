let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:10720d0b9b44603eb4194805b6c5fcafd5308d6f2c3ff150528ee3e8810d7532
  with on = On.match On.Event.ReleasesBranches "kubectl"
  with name = "kubectl (main)"
