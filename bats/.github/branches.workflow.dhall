let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:c64c59d7d479526de71df1763c356fdd11b96bc2150260071704d1e6bab97d0a
  with on = On.match On.Event.FeatureBranches "bats/**"
  with name = "bats (branch)"
