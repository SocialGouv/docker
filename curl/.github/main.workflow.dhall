let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:195da946f616eccab64d40d0ed4fb147568e506a4adb335b9cf6cd23d4bff890
  with on = On.match On.Event.ReleasesBranches "curl"
  with name = "curl (main)"
