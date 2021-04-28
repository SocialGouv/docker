let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:19a4bbeae668cf4968e5712d0829d1f76ab002f15dda02eb96510865642b8ef3
  with on = On.match On.Event.FeatureBranches "puppeteer"
  with name = "puppeteer (branch)"
