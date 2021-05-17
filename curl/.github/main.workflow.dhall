let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:a8d3fcfeff0b544a545a7b2d7f083d31c7cf9e447891158fa6464370b0fb5e45
  with on = On.match On.Event.ReleasesBranches "curl"
  with name = "curl (main)"
