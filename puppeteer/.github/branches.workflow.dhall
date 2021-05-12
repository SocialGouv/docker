let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:72da96e535a44b61ffb902b7d016091a842fd89aad44e53e8255de840db43c67
  with on = On.match On.Event.FeatureBranches "puppeteer"
  with name = "puppeteer (branch)"
