let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:df9403faeadfd59d84639d17c8158b8f206e58e29df851f49e1f889dde2bab0f
  with on = On.match On.Event.ReleasesBranches "curl"
  with name = "curl (main)"
