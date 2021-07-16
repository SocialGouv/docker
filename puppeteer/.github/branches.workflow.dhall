let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:f4e06f08d1d4efc389a0be86162668445c999a88cc1dd21b0e33c4dab540cbb8
  with on = On.match On.Event.FeatureBranches "puppeteer"
  with name = "puppeteer (branch)"
