let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:4c364f8d9c0b35947c3e243aaf77eb1ec2bd4f4304efcc0c729f795c6b5ad451
  with on = On.match On.Event.FeatureBranches "puppeteer"
  with name = "puppeteer (branch)"
