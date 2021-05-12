let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:1b3609e5df6adb71ea0730bef97c17acfe0ecc8bcb5712fed006a92789040d69
  with on = On.match On.Event.ReleasesBranches "kosko"
  with name = "kosko (main)"
