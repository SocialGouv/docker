let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:56241107d64225118284bba1e978b3de3ddf2c4af4eac4c18e0591fe34ef9cd1
  with on = On.match On.Event.ReleasesBranches "puppeteer"
  with name = "puppeteer (main)"
