let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:3fda1b5db3f4000af1a045919e7098ddb305c2869d17783890d3af78493decbc
  with on = On.match On.Event.FeatureBranches "azure-db/**"
  with name = "azure-db (branch)"
