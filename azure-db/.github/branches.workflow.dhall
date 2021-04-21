let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:5d2ca9534fdfbeb8eecad725d0132e30f878e4d2eb4177c265544231b5230420
  with on = On.match On.Event.FeatureBranches "azure-db/**"
  with name = "azure-db (branch)"
