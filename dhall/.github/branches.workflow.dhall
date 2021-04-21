let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:0a210e9c9c6d2591edba3044f15be5df2091186a00bfad0e18776cd5db86715e
  with on = On.match On.Event.FeatureBranches "dhall/**"
  with name = "dhall (branch)"
