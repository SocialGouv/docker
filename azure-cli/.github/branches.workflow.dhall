let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:357ed88d1891a18001fbd8e8923bbba1032f94f0ef879afd09139f155abbbc4a
  with on = On.match On.Event.FeatureBranches "azure-cli/**"
  with name = "azure-cli (branch)"
