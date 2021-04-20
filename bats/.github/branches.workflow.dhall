let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:cbd5d4e68688d88b755aad78a03f780083adc0ffcddc9689b1c55b92dbedcb56
  with on = On.match On.Event.FeatureBranches "azure-cli/**"
  with name = "azure-cli (branch)"
