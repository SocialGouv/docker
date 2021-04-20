let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:5d114b88f348d17a37dc3ed31dc90a586c9e0b241e5b7b79da593cb1765b0df6
  with on = On.match On.Event.ReleasesBranches "azure-cli/**"
  with name = "azure-cli (main)"
