let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:b6a5fc4eb04897d9d8026d737215078adaa619a7bb6bdea84c55aeb99da0a337
  with on = On.match On.Event.FeatureBranches "azure-cli/**"
  with name = "azure-cli (branch)"
