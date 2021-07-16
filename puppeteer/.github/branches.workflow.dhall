let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:abaec7d2374be8adda6f41f193d806cf6f088b78b8505e88767cc215b2c5b1e8
  with on = On.match On.Event.FeatureBranches "puppeteer"
  with name = "puppeteer (branch)"
