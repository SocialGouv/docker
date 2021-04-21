let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:5e8858727479dac5fc835345bd81c27bc5da6652dec600276b5f3570f9d4e1ba
  with on = On.match On.Event.FeatureBranches "curl/**"
  with name = "curl (branch)"
