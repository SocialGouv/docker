let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:80b708f356005b64c577320095df5b3b45ab996a779319cd8acece2654d16745
  with on = On.match On.Event.ReleasesBranches "puppeteer/**"
  with name = "puppeteer (main)"
