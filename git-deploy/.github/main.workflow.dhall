let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:fb3359b81cca99664f8eff7ef0e796ec9d9abcc6454831ce147696ddebf3668b
  with on = On.match On.Event.ReleasesBranches "git-deploy"
  with name = "git-deploy (main)"
