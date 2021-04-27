let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:58144e0691a4b51deeacb964514724281314cd6b5809f6306f4cc5e4e95e94d7
  with on = On.match On.Event.FeatureBranches "puppeteer"
  with name = "puppeteer (branch)"
