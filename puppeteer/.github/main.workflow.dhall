let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:b95e3b1d6527a3c86332f58a4c0a689d86f4497dcd97e77569668fb775defb02
  with on = On.match On.Event.ReleasesBranches "puppeteer"
  with name = "puppeteer (main)"
