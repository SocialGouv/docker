let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:fec8139e149589ac481e857485ff60fc57a0ca2797251c25e80ab0437e86d96a
  with on = On.match On.Event.ReleasesBranches "git-deploy"
  with name = "git-deploy (main)"
