let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:72250ef8de7df410e6202e3d50ba7923e5f40f3fcb0a39fd138fd5a79488e77d
  with on = On.match On.Event.FeatureBranches "azure-db/**"
  with name = "azure-db (branch)"
