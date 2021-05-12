let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:d22f138e90133d6a17c702233f126a84325562becbc911c591cd0894e682a6f2
  with on = On.match On.Event.FeatureBranches "puppeteer"
  with name = "puppeteer (branch)"
