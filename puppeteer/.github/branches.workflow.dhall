let On =
      ../../.github/dhall/workflows/On.dhall sha256:5a41bf6c38031ec114c83811c97bfff2923779dc571f4d0480f21e745646fb56

in  ./AssemblyLine.dhall sha256:3a0a816f7719d11d5f83a29ba39076f78e395803881a122b2e1ea975fa195d3e
  with on = On.match On.Event.FeatureBranches "puppeteer"
  with name = "puppeteer (branch)"
