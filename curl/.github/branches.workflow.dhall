let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:6efad23ed31adf39b767eefffb1754b783eafb6eeb79d7e8d29f1457c32425d0
  with on = On.match On.Event.FeatureBranches "curl/**"
  with name = "curl (branch)"
