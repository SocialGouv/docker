let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:0a0952e3c23d9d635aa1f333b898964403917f1a3b242c9cfe7af38bdc8dd1ff
  with on = On.match On.Event.FeatureBranches "azure-db/**"
  with name = "azure-db (branch)"
