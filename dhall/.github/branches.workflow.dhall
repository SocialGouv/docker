let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:1d53f534d8a77da9c0149c115fbebe0a3095ccbe4ea30631d12b90cd0533df5c
  with on = On.match On.Event.FeatureBranches "dhall/**"
  with name = "dhall (branch)"
