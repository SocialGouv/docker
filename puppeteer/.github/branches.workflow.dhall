let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:36a787372a51f4f56be56ed1ba4cae833c56398e236fa2f3a135ede86a0eacef
  with on = On.match On.Event.FeatureBranches "puppeteer"
  with name = "puppeteer (branch)"
