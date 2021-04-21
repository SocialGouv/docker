let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:2211648365327442c6a5cf9f1ff360d0642bcab23885d889e30cce0b4c1e4be0
  with on = On.match On.Event.FeatureBranches "bats/**"
  with name = "bats (branch)"
