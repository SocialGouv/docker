let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:5ba6872c0cd3bcb3a81ebfa146149ca0836dd0172e2860d89c98f00f93987de9
  with on = On.match On.Event.ReleasesBranches "git-deploy"
  with name = "git-deploy (main)"
