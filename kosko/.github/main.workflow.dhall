let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:fd200a62c4277a6119c0f55199b2f2a958a7f9563c6d27c6c441644be1182fec
  with on = On.match On.Event.ReleasesBranches "kosko"
  with name = "kosko (main)"
