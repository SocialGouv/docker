let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:1b2c8a90f01db58e43bd651e0c0d58eae7dfb9fdf2e2292e4b77e9d2069fd1f9
  with on = On.match On.Event.FeatureBranches "azure-cli/**"
  with name = "azure-cli (branch)"
