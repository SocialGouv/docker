let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:4a293c7568d1f3dcf293f6b54ce7b8e415115e54967462505acceed3c20b3944
  with on = On.match On.Event.ReleasesBranches "puppeteer"
  with name = "puppeteer (main)"
