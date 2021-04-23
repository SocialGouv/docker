let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:7861ae66f1c81e6b14e56e33090d87655cd5bc47aecec99fc9b824438a343dae
  with on = On.match On.Event.FeatureBranches "wait-for-postgres/**"
  with name = "wait-for-postgres (branch)"
