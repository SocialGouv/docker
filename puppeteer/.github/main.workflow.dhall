let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:f2fcb885fbea27416b65fab13aac9e187ce4d6e6940832fa14dd137ece40ffa8
  with on = On.match On.Event.ReleasesBranches "puppeteer"
  with name = "puppeteer (main)"
