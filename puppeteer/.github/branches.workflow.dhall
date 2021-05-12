let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:57bf01b8cc46edc4b0ef38c228bec839b58b7e6cefc54022384c5b8684b5e3df
  with on = On.match On.Event.FeatureBranches "puppeteer"
  with name = "puppeteer (branch)"
