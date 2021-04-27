let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:7d9c021b758af00ee92b9f17d26aaa7a745475123247a57d6c8689b5e720cc9e
  with on = On.match On.Event.ReleasesBranches "git-deploy"
  with name = "git-deploy (main)"
