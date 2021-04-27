let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:9b152e4e93a9f93d7f87c887125e4cd4f9c9197fcff074215a367f99cdf0dd30
  with on = On.match On.Event.ReleasesBranches "git-deploy"
  with name = "git-deploy (main)"
