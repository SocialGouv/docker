let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:1e2753b767f942c0705891e8d780730fd33b9ade2f10ab7fba363a599e962a06
  with on = On.match On.Event.FeatureBranches "puppeteer"
  with name = "puppeteer (branch)"
