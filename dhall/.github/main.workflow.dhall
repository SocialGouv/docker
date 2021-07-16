let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:26b5163ce8ecbda0799e3583c8eba40a6fd938c6cb6ce468054db4811b9ba5cf
  with on = On.match On.Event.ReleasesBranches "dhall"
  with name = "dhall (main)"
