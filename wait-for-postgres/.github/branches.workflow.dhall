let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:cb4719ea86b95430792d48367fee4c1374fbcf408835911b33312a04c0fb064f
  with on = On.match On.Event.FeatureBranches "wait-for-postgres/**"
  with name = "wait-for-postgres (branch)"
