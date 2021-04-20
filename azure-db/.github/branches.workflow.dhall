let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:55338f4c68e419de5d5bef14f095ce9aa519ab9aafe3b7b2b10599b09d62d37a
  with on = On.match On.Event.FeatureBranches "azure-db/**"
  with name = "azure-db (branch)"
