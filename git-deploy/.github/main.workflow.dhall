let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:f4e193b263b50d070b1253327e4ed603f2586c08d2b8ddecccf1704791991fed
  with on = On.match On.Event.ReleasesBranches "git-deploy"
  with name = "git-deploy (main)"
