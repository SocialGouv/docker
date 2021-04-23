let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:e4f5322d03ca48403e1400dacfe8ab769bed16f2e70a87c68f387d60ea1bef3c
  with on = On.match On.Event.FeatureBranches "git-deploy/**"
  with name = "git-deploy (branch)"
