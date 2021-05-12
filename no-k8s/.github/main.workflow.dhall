let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:26e202127b50118fa1971c0cf134c814f7a97642b95c2d415e5007bcd20d370b
  with on = On.match On.Event.ReleasesBranches "no-k8s"
  with name = "no-k8s (main)"
