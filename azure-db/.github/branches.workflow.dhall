let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:a1336b4c5e2f3cb1adf67f769d6499baa4723389492fa01286c664d55ff3902a
  with on = On.match On.Event.FeatureBranches "azure-db/**"
  with name = "azure-db (branch)"
