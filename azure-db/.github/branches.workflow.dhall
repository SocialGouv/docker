let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:bf36a31cc5c32ab49796d706cf22ba8a66fc9e7ea2722193e6c466db56e536d5
  with on = On.match On.Event.FeatureBranches "azure-db/**"
  with name = "azure-db (branch)"
