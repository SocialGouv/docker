let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:b664a43883e7a76effd9f227f127b62d8bb3b00fe629eb7a72ba15b59a3551ba
  with on = On.match On.Event.FeatureBranches "azure-db/**"
  with name = "azure-db (branch)"
