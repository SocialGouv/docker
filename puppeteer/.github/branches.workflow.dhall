let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:fd835b91e2575c40f73af907fa9e16c9a73d108c57428753484a453088dacb80
  with on = On.match On.Event.FeatureBranches "puppeteer"
  with name = "puppeteer (branch)"
