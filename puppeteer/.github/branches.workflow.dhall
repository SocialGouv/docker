let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:08b3024fcbb3b6303ef0b2687510dcc5c90167d94bdceb5cf2843511fba60e75
  with on = On.match On.Event.FeatureBranches "puppeteer"
  with name = "puppeteer (branch)"
