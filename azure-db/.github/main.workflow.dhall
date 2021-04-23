let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:b507d88407c4f3efeea65f71b6d0e44ba559d7ddce72228f66b1a5981df97ac7
  with on = On.match On.Event.ReleasesBranches "azure-db/**"
  with name = "azure-db (main)"
