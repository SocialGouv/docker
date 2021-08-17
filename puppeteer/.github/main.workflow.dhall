let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:2f9b5e476d68410b6513884f9c89b96906453bde32e7198b61aef66b8a5cc0e0
  with on = On.match On.Event.ReleasesBranches "puppeteer"
  with name = "puppeteer (main)"
