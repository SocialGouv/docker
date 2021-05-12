let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:310cbe0d103b42363adefff93ea4a906c332767ef9e42270d8e1f35513bacb96
  with on = On.match On.Event.ReleasesBranches "git-deploy"
  with name = "git-deploy (main)"
