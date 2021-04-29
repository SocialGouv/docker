let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:4a44a13f8930976b8aa94ca34abc2ad474d70515d8e14b336aa83b5ebd1272da
  with on = On.match On.Event.ReleasesBranches "puppeteer"
  with name = "puppeteer (main)"
