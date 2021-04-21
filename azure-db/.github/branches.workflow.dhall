let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:21109fcf56dd3ab0381b89768710d2e59e4016e792eee0b3731ae4f94a55545e
  with on = On.match On.Event.FeatureBranches "azure-db/**"
  with name = "azure-db (branch)"
