let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:d49dfe95275bb447d63115b48952674cc1de7d69476a1949b9b4a52e3fea14c6
  with on = On.match On.Event.FeatureBranches "puppeteer"
  with name = "puppeteer (branch)"
