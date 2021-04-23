let On =
      ../../.github/dhall/workflows/On.dhall sha256:d23719eb25b176ea1e5a7f7e0f722456716b5eee894c39f63ce849fccdf2dd95

in  ./AssemblyLine.dhall sha256:0ae640b5e8888a57e248c8bb30d451880441ffb01807fc4e765a63eec9ac6a5e
  with on = On.match On.Event.FeatureBranches "puppeteer/**"
  with name = "puppeteer (branch)"
