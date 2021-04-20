let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:f235b04bd3c4938db78677582c01b773f5c8b454876e26fec2dd39b1253b4efc
  with on = On.match On.Event.FeatureBranches "azure-cli/**"
  with name = "azure-cli (branch)"
