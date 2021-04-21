let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:c82504d65c6c2ea4b05a17b3e3d8592d84a1d20b78f8a3e3bb7dab6e0121a496
  with on = On.match On.Event.FeatureBranches "bats/**"
  with name = "bats (branch)"
