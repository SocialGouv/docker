let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:adbcb587e02f9868fdff544490e9def4f4d076dc8d82df91f04cfbe2b7930e0d
  with on = On.match On.Event.FeatureBranches "puppeteer"
  with name = "puppeteer (branch)"
