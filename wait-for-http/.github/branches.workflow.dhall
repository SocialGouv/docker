let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:1017ceacb3fe3e8f5247ace28e69773f1afd0e2ebb2698d4f83a2c101c0a544b
  with on = On.match On.Event.FeatureBranches "wait-for-http/**"
  with name = "wait-for-http (branch)"
