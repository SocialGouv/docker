let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:ab56a76117b2b49bc8442a793d6334b8b2640bbc082190c1ded1d1fb2c63876b
  with on = On.match On.Event.FeatureBranches "dhall/**"
  with name = "dhall (branch)"
