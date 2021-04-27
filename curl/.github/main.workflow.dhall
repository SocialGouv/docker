let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:2b8a629359537e616c40c56ae467021c5de3aaf0eee7b0858d828cb39776c019
  with on = On.match On.Event.ReleasesBranches "curl"
  with name = "curl (main)"
