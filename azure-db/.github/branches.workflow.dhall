let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:8bdc730f747f1863e6943659c602898dda7a10e4e2fe1e5cdf0be3bd07c0d9c1
  with on = On.match On.Event.FeatureBranches "azure-db/**"
  with name = "azure-db (branch)"
