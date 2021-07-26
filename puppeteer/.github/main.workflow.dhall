let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:5f4a722bb247929da93e514d49cd855f377cd050590b02b8cd5f180beb92460a
  with on = On.match On.Event.ReleasesBranches "puppeteer"
  with name = "puppeteer (main)"
