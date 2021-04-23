let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:0ae640b5e8888a57e248c8bb30d451880441ffb01807fc4e765a63eec9ac6a5e
  with on = On.match On.Event.FeatureBranches "puppeteer/**"
  with name = "puppeteer (branch)"
