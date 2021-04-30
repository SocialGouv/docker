let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:3a0a816f7719d11d5f83a29ba39076f78e395803881a122b2e1ea975fa195d3e
  with on = On.match On.Event.ReleasesBranches "puppeteer"
  with name = "puppeteer (main)"
