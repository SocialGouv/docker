let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:88d2070b86c5bb1ecf160120660b539c47ff4b48e4a1456efe05cbb02eff1356
  with on = On.match On.Event.ReleasesBranches "puppeteer"
  with name = "puppeteer (main)"
