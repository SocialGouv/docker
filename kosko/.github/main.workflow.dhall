let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:6e3deab9669b580b495b85f3c59120c8d40ec1a5a36cc43ee371a1ac7adfe394
  with on = On.match On.Event.ReleasesBranches "kosko"
  with name = "kosko (main)"
