let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:4203b50534641a359ea785f1cd3f4e44b39024ba941e6f8a25a0062619ccccf1
  with on = On.match On.Event.ReleasesBranches "git-deploy"
  with name = "git-deploy (main)"
