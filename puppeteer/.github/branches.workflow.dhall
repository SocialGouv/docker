let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:63b448a7c5593b18c709990fdd6780eb8c10be80a263e4547a7fd151d4947ba6
  with on = On.match On.Event.FeatureBranches "puppeteer"
  with name = "puppeteer (branch)"
