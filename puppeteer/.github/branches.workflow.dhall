let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:a7c11153590c76fc1289dae60582546e98d598bfe7dca0320b33df94a31b5c77
  with on = On.match On.Event.FeatureBranches "puppeteer"
  with name = "puppeteer (branch)"
